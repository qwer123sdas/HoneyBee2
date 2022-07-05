package com.team.honeybee.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.team.honeybee.domain.MeetingCommentDto;
import com.team.honeybee.domain.MeetingDto;
import com.team.honeybee.mapper.MeetingMapper;
import com.team.honeybee.mapper.MeetingSummerNoteMapper;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class MeetingService {
	
	@Autowired
	private MeetingMapper mapper;
	
	@Autowired
	private MeetingSummerNoteMapper summerNoteMapper;
	
	// s3 bucket
	private S3Client amazonS3;
	
	@Value("${aws.s3.bucketName}")
	private String bucketName;
	
	@PostConstruct
	public void init() {
		Region region = Region.AP_NORTHEAST_2;
		this.amazonS3 = S3Client.builder().region(region).build();
	}
	
	@PreDestroy // 자원 닫기
	public void destory() {
		this.amazonS3.close();
	}
	
	
	// 게시물 등록
	@Transactional
	public boolean insertBoard(MeetingDto meeting, MultipartFile mainPhoto, String hashTagRaw, String folderName) { 
		// 게시글 등록
		int cnt = mapper.insertMeeting(meeting);
		// 해쉬태그 매소드에 태그랑 아이디값 넣기
		hashTagInsertBoardBymeetingId(hashTagRaw, meeting.getMeetingId()); 
		
		// 메인사진 등록
		if(mainPhoto.getSize() > 0) {
			// db 메인사진 저장
			mapper.insertMainPhoto(meeting.getMeetingId(), mainPhoto.getOriginalFilename(), meeting.getMemberId(), folderName);
			// s3 bucket 메인사진 등록
			saveMainPhotoAwsS3(meeting.getMeetingId(), mainPhoto, folderName);
		}
		
		// Jsoup :  실제 이미지 업로드 확인
		Document doc = Jsoup.parse(meeting.getContent());
		Elements imgs = doc.select("img[src]");
		
		// 사용 이미지 리스트
		List<String> isImage = new ArrayList<>();
		for(Element img : imgs) {
			isImage.add(img.attr("src"));
		}
		
		System.out.println("isImage : "+ isImage);
		
		// 사용하지 않는 이미지 리스트
		String imageFolderId = folderName;
		System.out.println("사용하지 않는 이미지 리스트 imageFolderId " + imageFolderId);
		List<String> dbImageUrlList = summerNoteMapper.getImageUrlByImageFolderId(imageFolderId);
		System.out.println(dbImageUrlList);
				
		// 리스트 비교해서 없는것 db에서 삭제
		for(String imageUrl : dbImageUrlList) {
			if(imageUrl != null && !isImage.contains(imageUrl)) {
				// db 지우기
				System.out.println("db 지우기");
				summerNoteMapper.deleteImage(imageUrl);
				
				// s3 지우기
				deleteFromAwsS3(imageUrl);
			}
		}
		// meetingId 넣어주기
		summerNoteMapper.setMeetingId(meeting.getMeetingId(), imageFolderId);
		
		
		
		return cnt == 1;
	}
	
	// 해쉬태그 분리 로직 매소드
	private void hashTagInsertBoardBymeetingId(String hashTagRaw, int meetingId) {
		System.out.println("해쉬ㅣ태그 : " + hashTagRaw);
		System.out.println(meetingId);
		String hashTag[] = hashTagRaw.split("#");
		for(int i = 1; i < hashTag.length; i++) {
			mapper.setHashTag(hashTag[i].replaceAll(" ", ""), meetingId);
		}
		
	}
	
	// 해쉬태그 업데이트 분리 로직 매소드
	private void updatehashTagBymeetingId(String hashTagRaw, int meetingId) {
		// 기존 해시태그 삭제
		mapper.deleteHashTagByMeetingId(meetingId);
		
		String hashTag[] = hashTagRaw.split("#");
		for(int i = 1; i < hashTag.length; i++) {
			mapper.setHashTag(hashTag[i].replaceAll(" ", ""), meetingId);
		}
	}
	
	// 모임 리스트(topic추가함)
	@Transactional
	public List<MeetingDto> meetingList(String sort, String topic) {
		
		return mapper.selectMeeting(sort, topic);
	}
	
	// 기부모임 게시물 보기
	@Transactional
	public MeetingDto getBoardByMeetingId(int meetingId) {
		// 게시물 가져오기
		MeetingDto meeting = mapper.selectBoardByMeetingId(meetingId);
		
		
		// 해쉬태그 가져오기
		List<String> hashTag = mapper.getHashTag(meetingId);
		meeting.setHashTag(hashTag); 
		return meeting;
	
	}

	/* 서머노트 사용으로 필요없음
	// 파일 여러개
	private void addFiles(int meetingId, MultipartFile[] files) {
		if (files != null) {
			for (MultipartFile file : files) {
				if (file.getSize() > 0) {
					mapper.insertFile(meetingId, file.getOriginalFilename());
					saveFileAwsS3(meetingId, file);
				}
	
			}
		}
		
	}
	*/
	
	
	// 후기 입력 모달
	public void meetingCommentAdd(String memberId, String content) {
		mapper.meetingCommentAdd(memberId, content);
		
	}
	
	// 게시판 수정
	public void updateByMeetingBoard(MeetingDto meeting, String hashTagRaw, 
										MultipartFile mainPhoto, String folderName,
										String oldMainPhoto) {
		
		// 게시글 업데이트
		mapper.updateByMeetingBoard(meeting);

		// 해쉬태그 업데이트
		updatehashTagBymeetingId(hashTagRaw, meeting.getMeetingId());

		// 메인 사진 수정
		System.out.println("메인사진 : " + mainPhoto.getOriginalFilename());
		System.out.println(oldMainPhoto);
		System.out.println(mainPhoto);
		System.out.println(mainPhoto.isEmpty());
		if (mainPhoto.getOriginalFilename() != oldMainPhoto && !mainPhoto.isEmpty()) {
			System.out.println("사진 삭제 실행됨???");
			// 기존 사진 삭제
			
			deleteFromAwsS3FromNewMainPhoto(folderName, oldMainPhoto);
			
			// 새로운 사진 업로드
			saveMainPhotoAwsS3(meeting.getMeetingId(), mainPhoto, folderName);
			
			// 게시글 사진 db 수정
			int boardImageId = summerNoteMapper.selectBoardImageId(oldMainPhoto, meeting.getMeetingId());
			summerNoteMapper.updateBoardImage(boardImageId, mainPhoto.getOriginalFilename());
		}

		// Jsoup : 수정된 이미지 업로드 구분
		Document doc = Jsoup.parse(meeting.getContent());
		Elements imgs = doc.select("img[src]");

		// 실제 사용 이미지 리스트
		List<String> isImage = new ArrayList<>();
		for (Element img : imgs) {
			isImage.add(img.attr("src"));
		}

		System.out.println("isImage : " + isImage);

		// 사용하지 않는 이미지 리스트
		String imageFolderId = folderName;
		System.out.println("사용하지 않는 이미지 리스트 imageFolderId " + imageFolderId);
		
		List<String> dbImageUrlList = summerNoteMapper.getImageUrlByImageFolderId(imageFolderId);
		System.out.println(dbImageUrlList);

		// 리스트 비교해서 없는것 db에서 삭제
		for (String imageUrl : dbImageUrlList) {
			if (imageUrl != null && !isImage.contains(imageUrl)) {
				// db 지우기
				System.out.println("db 지우기");
				summerNoteMapper.deleteImage(imageUrl);

				// s3 지우기
				deleteFromAwsS3(imageUrl);
			}
		}
		// meetingId 넣어주기
		summerNoteMapper.setMeetingId(meeting.getMeetingId(), imageFolderId);

	}
	

	// s3 bucket 메인사진 등록
	private void saveMainPhotoAwsS3(int meetingId, MultipartFile mainPhoto, String folderName) {
		
		String key = "meeting/" + folderName + "/" + mainPhoto.getOriginalFilename();
		
		PutObjectRequest putObjectRequest = PutObjectRequest.builder()
				.acl(ObjectCannedACL.PUBLIC_READ) 
				.bucket(bucketName) 
				.key(key) 
				.build(); 
		
		
		RequestBody requestBody;
		try {                                          
			requestBody = RequestBody.fromInputStream(mainPhoto.getInputStream(), mainPhoto.getSize());
			amazonS3.putObject(putObjectRequest, requestBody);
			
		} catch (IOException e) {
			e.printStackTrace();
			
			throw new RuntimeException(e);
		}
	}
	
	// 게시글 수정용, 기존 사진 삭제 메소드
	private void deleteFromAwsS3FromNewMainPhoto(String folderName, String oldMainPhoto) {
		String key = "meeting/" + folderName + "/" + oldMainPhoto;
		
		System.out.println("지울 키");
		System.out.println(key);
		
		DeleteObjectRequest deleteBucketRequest;
		deleteBucketRequest = DeleteObjectRequest.builder()
				.bucket(bucketName)
				.key(key)
				.build();
		
		amazonS3.deleteObject(deleteBucketRequest);
		
	}
	
	// aws의 s3에서 사진삭제 메소드
	private void deleteFromAwsS3(String fileName) {
		System.out.println("삭제");
		System.out.println(fileName.substring(56)); // 팀플 56
		String key = fileName.substring(56);
		
		DeleteObjectRequest deleteBucketRequest;
		deleteBucketRequest = DeleteObjectRequest.builder()
				.bucket(bucketName)
				.key(key)
				.build();
		
		amazonS3.deleteObject(deleteBucketRequest);
		
	}
	
	/* 데스크탑 저장용 메소드
	// 파일 저장 메소드
	private void saveFile(int meetingId, MultipartFile file) {
	
		String pathStr = "C:/imgtmp/board/" + meetingId + "/";
		File path = new File(pathStr);
		path.mkdir();
			
		
		File des = new File(pathStr + file.getOriginalFilename());
			
		
		try {
			file.transferTo(des);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
			
	}
	*/


	

}
