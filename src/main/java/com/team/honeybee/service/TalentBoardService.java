package com.team.honeybee.service;

import java.io.IOException;
import java.util.ArrayList;
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
import com.team.honeybee.domain.TalentBoardDto;
import com.team.honeybee.domain.TalentReivewDto;
import com.team.honeybee.mapper.SummerNoteMapper;
import com.team.honeybee.mapper.TalentBoardMapper;
import com.team.honeybee.mapper.TalentReviewMapper;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class TalentBoardService {
	@Autowired
	TalentBoardMapper mapper;
	
	@Autowired
	SummerNoteMapper summerNoteMapper;
	
	@Autowired
	TalentReviewMapper reviewMapper;
	
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
	
	
	
	
	// 게시물 리스트 가져오기
	public List<TalentBoardDto> findBoardList(String topic, String sort) {
		// 리스트 불러오기
		List<TalentBoardDto> boardList =  mapper.findBoardList(topic, sort);
		
		
		// 각 리스트에 각 게시판의 평점 넣기
		for(TalentBoardDto board : boardList) {
			int talentId = board.getTalentId();
			TalentReivewDto reviewDto = reviewMapper.getTotalStarRating(talentId);
			double sum = reviewDto.getStarSum();
			int count = reviewDto.getStarCount();
			double result = 0;
			if(count != 0) {
				result = sum / count;
			}
			
			board.setStarCount(count);
			board.setAverageStarRating(result);
			
		}
		
		return boardList;
	}
	
	// 특정 게시물 정보 가져오기
	// 로그인 x
	public TalentBoardDto getBoardByTalentId(int talentId) {
		// 별점 총합 가져오기 + 평균내기
		TalentReivewDto reviewDto = reviewMapper.getTotalStarRating(talentId);
		
		
		double sum = reviewDto.getStarSum();
		int count = reviewDto.getStarCount();
		double result = 0;
		if(count != 0) {
			result = sum / count;
		}
		
		// 게시글 내용물 가져오기
		TalentBoardDto dto =  mapper.getBoard(talentId, null);
		dto.setStarCount(count);
		dto.setAverageStarRating(result);
		
		return dto;
	}
	
	// 로그인 o
	public TalentBoardDto getBoardWithOwnByTalentId(int talentId, String memberId) {
		// 별점 총합 가져오기 + 평균내기
		TalentReivewDto reviewDto = reviewMapper.getTotalStarRating(talentId);
		
		
		double sum = reviewDto.getStarSum();
		int count = reviewDto.getStarCount();
		double result = 0;
		if(count != 0) {
			result = sum / count;
		}
		
		// 게시글 내용물 가져오기
		TalentBoardDto dto =  mapper.getBoard(talentId, memberId);
		dto.setStarCount(count);
		dto.setAverageStarRating(result);
		
		return dto;
		
	}

	// 게시글 작성하기
	public void setTalentBoard(TalentBoardDto dto, MultipartFile mainPhoto, String folderName) {
		// 게시글 항목 저장
		String productCode = UUID.randomUUID().toString();
		dto.setProductCode(productCode);
		
		mapper.setTalentBoard(dto);
		
		// 메인 사진 등록-----------------------
		if(mainPhoto.getSize() > 0) {
			// db 저장
			mapper.insertMainPhoto(dto.getTalentId(), mainPhoto.getOriginalFilename(), dto.getMemberId(), folderName);
			
			// s3 저장
			saveMainPhotoAwsS3(mainPhoto, folderName); 
		}
		
		// Jsoup :  서머노트 수정된 이미지 업로드 판별
		Document doc = Jsoup.parse(dto.getContent());
		Elements imgs = doc.select("img[src]");
		// 정말 사용하는 이미지 리스트
		List<String> isImage = new ArrayList<>();
		for(Element img : imgs) {
			isImage.add(img.attr("src"));
		}
		
		// 사용하지 않는 이미지 리스트
		// image_folder_id로 해당 db에 있는 이미지 정보 전부 가져오기
		String imageFolderId =  folderName;
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

		// 게시글 작성 까지, 업로드 될 이미지에 id넣기
		summerNoteMapper.setTalentIdByTalent(dto.getTalentId(), imageFolderId);
		
		
		
	}
	// 메인 사진 등록 메소드
	private void saveMainPhotoAwsS3(MultipartFile mainPhoto, String folderName) {
		// board/temp/12344.png
		String key = "talent/" + folderName + "/" + mainPhoto.getOriginalFilename();
		
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
	
	// ++ aws의 s3에서 사진 삭제 메소드
	private void deleteFromAwsS3(String fileName) {
		System.out.println("삭제 가동");
		System.out.println(fileName.substring(56));
		// 내거 75
		// 팀플 56
		String key = fileName.substring(56);
		
		DeleteObjectRequest deleteBucketRequest;
		deleteBucketRequest = DeleteObjectRequest.builder()
				.bucket(bucketName)
				.key(key)
				.build();
		
		amazonS3.deleteObject(deleteBucketRequest);
		
	}
	// 게시글 수정, 메인 사진 S3수정
	private void deleteFromAwsS3FromNewMainPhoto(MultipartFile newMainPhoto, String folderName) {
		String key = "talent/" + folderName + "/" + newMainPhoto.getOriginalFilename();
				
		DeleteObjectRequest deleteBucketRequest;
		deleteBucketRequest = DeleteObjectRequest.builder()
				.bucket(bucketName)
				.key(key)
				.build();
		
		amazonS3.deleteObject(deleteBucketRequest);
	}
	
	
	// 메인 화면, 검색 목록
	public List<TalentBoardDto> selectTalentBoardBySearch(String string) {
		System.out.println(string);
		return mapper.selectTalentBoardBySearch(string);
	}

	
	// 게시글 수정 작업
	@Transactional
	public void updateTalentBoard(TalentBoardDto dto, MultipartFile mainPhoto, String folderName, String oldMainPhoto) {
		// 메인 사진 수정 할 때,
		System.out.println("메인 사진 수정");
		System.out.println(mainPhoto.getOriginalFilename());
		System.out.println(oldMainPhoto);
		System.out.println(dto);
		if(mainPhoto.getOriginalFilename() != oldMainPhoto && !mainPhoto.isEmpty()) {
			System.out.println("삭제?");
			//기존 것 삭제
			deleteFromAwsS3FromNewMainPhoto(mainPhoto, folderName);
			// 새로 업로드
			saveMainPhotoAwsS3(mainPhoto, folderName);
			// db 수정
			int boardImageId = summerNoteMapper.selectTalentBoardImageId(oldMainPhoto, dto.getTalentId());
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
		// 게시글 작성 까지, 업로드 될 이미지에 id넣기
		summerNoteMapper.setTalentIdByTalent(dto.getTalentId(), folderName);
		
		
		// 수정된 게시글 내용 넣기
		mapper.updateTalentBoard(dto);
	}
	
	

	
	
}
