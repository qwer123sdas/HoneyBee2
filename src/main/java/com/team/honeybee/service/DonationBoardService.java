package com.team.honeybee.service;

import java.io.IOException;
import java.lang.annotation.Target;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.team.honeybee.domain.DonationBoardDto;
import com.team.honeybee.domain.DonationReplyDto;
import com.team.honeybee.domain.SummerNoteDto;
import com.team.honeybee.mapper.DonationBoardMapper;
import com.team.honeybee.mapper.DonationPayMapper;
import com.team.honeybee.mapper.DonationReplyMapper;
import com.team.honeybee.mapper.SummerNoteMapper;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class DonationBoardService {
	@Autowired
	DonationBoardMapper mapper;
	
	@Autowired
	DonationReplyMapper replyMapper;
	
	@Autowired
	DonationPayMapper payMapper;
	
	@Autowired
	PointService pointService;
	
	@Autowired
	SummerNoteMapper summerNoteMapper;
	
	@org.springframework.beans.factory.annotation.Value("${aws.s3.bucketName}")
	private String bucketName;
	
	private S3Client amazonS3; 
	
	@PostConstruct   // s3 빈 생성
	public void init() {
		Region region = Region.AP_NORTHEAST_2;
		this.amazonS3 = S3Client.builder()
						.region(region)
						.build();
	}
	@PreDestroy // s3 빈이 사라지기 전
	public void destroy() {
		this.amazonS3.close();
	}
	
	// 게시글 목록
	public List<DonationBoardDto> findOrder(String sort, String topic) {
		return mapper.selectOrder(sort, topic);
	}
	
	// 기부 게시글 보기
	// 로그인 x
	@Transactional
	public DonationBoardDto getBoardByBoardId(int donationId) {
		DonationBoardDto dto = mapper.getBoard(donationId, null);
		
		// 해쉬태그 가져오기
		List<String> hashTags = mapper.getHashTag(donationId);
		dto.setHashTag(hashTags);
		
		return dto;
	}
	// 로그인 o
	public DonationBoardDto getBoardWithOwnByBoardId(int donationId, String memberId) {
		DonationBoardDto dto = mapper.getBoard(donationId, memberId);
		// 해쉬태그 가져오기
		List<String> hashTags = mapper.getHashTag(donationId);
		dto.setHashTag(hashTags);
		return dto;
	}

	// [임시] 도네이션 작성 게시판----------------------------------------------------------------------------------------
	@Transactional
	public void dontaionBoardWrite(DonationBoardDto dto, MultipartFile mainPhoto, String hashTagLump, String folderName) {
		// 게시글 항목 저장
		String productCode = UUID.randomUUID().toString();
		dto.setProductCode(productCode);
		
		mapper.dontaionBoardWrite(dto);
		System.out.println("dto : " + dto);
		
		// 해쉬 태그 분류 + db에 넣는 메소드
		makeHashTagWithoutShop(hashTagLump, dto.getDonationId());
		
	
		// 메인 사진 등록-----------------------
		if(mainPhoto.getSize() > 0) {
			// db 저장
			mapper.insertMainPhoto(dto.getDonationId(), mainPhoto.getOriginalFilename(), dto.getMemberId(), folderName);
			
			// s3 저장
			saveMainPhotoAwsS3(mainPhoto, folderName); 
		}
		
		
		// Jsoup :  서머노트 수정된 이미지 업로드 판별
		//List<String> uploadImageAtTestArea = new ArrayList<>();
		Document doc = Jsoup.parse(dto.getContent());
		Elements imgs = doc.select("img[src]");
			// 정말 사용하는 이미지 리스트
		List<String> isImage = new ArrayList<>();
		for(Element img : imgs) {
			isImage.add(img.attr("src"));
		}
		System.out.println("isImage : "+ isImage);
		
		// 사용하지 않는 이미지 리스트
		// image_folder_id로 해당 db에 있는 이미지 정보 가져오기
		String imageFolderId = folderName;
		
		List<String> dbImageUrlList = summerNoteMapper.getImageUrlByImageFolderId(imageFolderId);
		
		// 리스트끼리 비교해서 없는 것 분별하고 없는 거 db에서 삭제하기
		for(String imageUrl : dbImageUrlList) {
			if(imageUrl !=null && !isImage.contains(imageUrl)) {
				// db 지우기
				System.out.println("db 지우기");
				summerNoteMapper.deleteImage(imageUrl);
				
				// s3 지우기
				deleteFromAwsS3(imageUrl);
			}
		}
		// donationId 넣어주기
		summerNoteMapper.setDonationId(dto.getDonationId(), imageFolderId);
		

	}
	
	
	// 메인 화면, 검색 목록
	public List<DonationBoardDto> selectDonationBoardBySearch(String keyword) {
		return mapper.selectDonationBoardBySearch(keyword);
	}
	
	
	// 게시글 수정
	public void updateDonationBoard(DonationBoardDto dto, String hashTagLump, MultipartFile mainPhoto,
									String folderName, String oldMainPhoto) {
		// 게시글 항목 저장
		mapper.updateDonationBoard(dto);
		System.out.println("dto : " + dto);
		
		// 해쉬 태그 분류 + db 수정 메소드
		modifyHashTagWithoutShop(hashTagLump, dto.getDonationId());
		
		// 메인 사진 수정 할 때,
		System.out.println("메인사진 : " + mainPhoto.getOriginalFilename());
		if(mainPhoto.getOriginalFilename() != oldMainPhoto && !mainPhoto.isEmpty()) {
			//기존 것 삭제
			deleteFromAwsS3FromNewMainPhoto(oldMainPhoto, folderName);
			// 새로 업로드
			saveMainPhotoAwsS3(mainPhoto, folderName);
			// db 수정
			int boardImageId = summerNoteMapper.selectDonationBoardImageId(oldMainPhoto, dto.getDonationId());
			summerNoteMapper.updateBoardImage(boardImageId, mainPhoto.getOriginalFilename());
		}
		
		// Jsoup :  서머노트 수정된 이미지 업로드 판별
		Document doc = Jsoup.parse(dto.getContent());
		Elements imgs = doc.select("img[src]");
		// 정말 사용하는 이미지 리스트
		List<String> isImage = new ArrayList<>();
		for(Element img : imgs) {
			isImage.add(img.attr("src"));
		}
		List<String> dbImageUrlList = summerNoteMapper.getImageUrlByImageFolderId(folderName);
		// 리스트끼리 비교해서 없는 것 분별하고 없는 거 db에서 삭제하기
		for(String imageUrl : dbImageUrlList) {
			if(imageUrl !=null && !isImage.contains(imageUrl)) {
				// db 지우기
				System.out.println("db 지우기");
				summerNoteMapper.deleteImage(imageUrl);
				
				// s3 지우기
				deleteFromAwsS3(imageUrl);
			}
		}
		// donationId 넣어주기
		summerNoteMapper.setDonationId(dto.getDonationId(), folderName);
	}
	
	// 메인 사진 등록 메소드
	private void saveMainPhotoAwsS3(MultipartFile mainPhoto, String folderName) {
		// board/temp/12344.png
		String key = "donation/" + folderName + "/" + mainPhoto.getOriginalFilename();
		
		PutObjectRequest putObjectRequest = PutObjectRequest.builder()
				.acl(ObjectCannedACL.PUBLIC_READ) 		 // acl : 권한 설정
				.bucket(bucketName) 					// bucket 위치 설정
				.key(key)								// 키
				.build(); 								 // 이를 통해 PutObjectRequest객체 만듬
		
		RequestBody requestBody;
		try {
			requestBody = RequestBody.fromInputStream(mainPhoto.getInputStream(), mainPhoto.getSize());
			amazonS3.putObject(putObjectRequest, requestBody);
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e); // 트랜잭션 때문에 모두 실패????????????
		}
	}
		
	
	
	// ++ aws의 s3에서 summerNote에 없는 사진 삭제 메소드
	private void deleteFromAwsS3(String imageUrl) {
		System.out.println("삭제 가동");
		// 내거 75
		// 팀플 56
		System.out.println(imageUrl.substring(56));
		String key = imageUrl.substring(56);
		System.out.println(key);
		DeleteObjectRequest deleteBucketRequest;
		deleteBucketRequest = DeleteObjectRequest.builder()
				.bucket(bucketName)
				.key(key)
				.build();
		
		amazonS3.deleteObject(deleteBucketRequest);
		
	}
		
	// 게시글 수정, 기존 메인 사진 S3수정
	private void deleteFromAwsS3FromNewMainPhoto(String oldMainPhoto, String folderName) {
		String key = "donation/" + folderName + "/" + oldMainPhoto;
				
		DeleteObjectRequest deleteBucketRequest;
		deleteBucketRequest = DeleteObjectRequest.builder()
				.bucket(bucketName)
				.key(key)
				.build();
		
		amazonS3.deleteObject(deleteBucketRequest);
	}

	
	// 해쉬태그 분류하기 + db에 넣기 메소드
	public void makeHashTagWithoutShop(String hashTagLump, int donationId) {
		
		String hashTag[] = hashTagLump.split("#");
		for(int i = 1; i < hashTag.length; i++) {
			// hashTags.add(hashTag[i].replaceAll(" ", "")); // 띄어쓰기 제거 후 넣기
			mapper.setHashTag(hashTag[i].replaceAll(" ", ""), donationId);
		}
	}
		
	// 해쉬태그 분류 + 수정한 값 db에 넣기
	public void modifyHashTagWithoutShop(String hashTagLump, int donationId) {
		String hashTag[] = hashTagLump.split("#");
		
		// 기존에 있는 것 삭제하기
		mapper.removeExistingHashTag(donationId);
		
		for(int i = 1; i < hashTag.length; i++) {
			System.out.println(hashTag[i].replaceAll(" ", ""));
			mapper.setHashTag(hashTag[i].replaceAll(" ", ""), donationId);
		}
	}
		
	//--------------------------------------------------------------------------------------------------------------------
	
	// 기부금 결제
	/*
	@Transactional
	public void donate(int donationId, int amount, String content, String memberId) {
		// 후기 저장
		DonationReplyDto replyDto = new DonationReplyDto();
		replyDto.setDonationId(donationId);
		replyDto.setContent(content);
		replyDto.setMemberId(memberId);
		replyMapper.addReply(replyDto);
		int replyIdForPay = replyDto.getReplyId();
		
		// 기부금액 저장
		payMapper.donate(amount, memberId, donationId, replyIdForPay);
		
		// 총 모금액 기록
		payMapper.addAmount(donationId);
		
		
		
	}
	*/

}
