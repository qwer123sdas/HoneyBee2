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
	private S3Client s3;
	
	@Value("${aws.s3.bucketName}")
	private String bucketName;
	
	@PostConstruct
	public void init() {
		Region region = Region.AP_NORTHEAST_2;
		this.s3 = S3Client.builder().region(region).build();
	}
	
	@PreDestroy // 자원 닫기
	public void destory() {
		this.s3.close();
	}
	
	// 해쉬태그 분리 로직 매소드
	private void hashTagInsertBoardBymeetingId(String hashTagRaw, int meetingId) {
		
		String hashTag[] = hashTagRaw.split("#");
		for(int i = 1; i < hashTag.length; i++) {
			mapper.setHashTag(hashTag[i].replaceAll(" ", ""), meetingId);
		}
		
	}
	
	// 게시물 등록
	@Transactional
	public boolean insertBoard(MeetingDto meeting, MultipartFile mainPhoto, String hashTagRaw) { 
		// 게시글 등록
		int cnt = mapper.insertMeeting(meeting);
		// 해쉬태그 매소드에 태그랑 아이디값 넣기
		hashTagInsertBoardBymeetingId(hashTagRaw, meeting.getMeetingId()); 
		
		// 메인사진 등록
		if(mainPhoto.getSize() > 0) {
			// db 저장
			mapper.insertFile(meeting.getMeetingId(), mainPhoto.getOriginalFilename());
			// s3 저장
			saveFileAwsS3(meeting.getMeetingId(), mainPhoto);
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
		String imageFolderId = summerNoteMapper.getImageFolderIdImageUrl(isImage.get(0));
		List<String> dbImageUrlList = summerNoteMapper.getImageUrlByImageFolderId(imageFolderId);
				
		// 리스트 비교해서 없는것 db에서 삭제
		for(String imageUrl : dbImageUrlList) {
			if(! isImage.contains(imageUrl)) {
				// db 지우기
				System.out.println("db 지우기");
				summerNoteMapper.deleteImage(imageUrl);
				
				// s3 지우기
				deleteFromAwsS3(imageUrl);
			}
		}
		// donationId 넣어주기
		summerNoteMapper.setMeetingId(meeting.getMeetingId(), imageFolderId);
		
		
		
		return cnt == 1;
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
	
	// s3 bucket 메인사진 등록
	private void saveFileAwsS3(int meetingId, MultipartFile file) {
		
		String key = "meeting/mainPhoto/" + meetingId + "/" + file.getOriginalFilename();
		
		PutObjectRequest putObjectRequest = PutObjectRequest.builder()
					.acl(ObjectCannedACL.PUBLIC_READ) 
					.bucket(bucketName) 
					.key(key) 
					.build(); 
			
			
			RequestBody requestBody;
			try {                                          
				requestBody = RequestBody.fromInputStream(file.getInputStream(), file.getSize());
				
				s3.putObject(putObjectRequest, requestBody);
			} catch (IOException e) {
				e.printStackTrace();
				
				throw new RuntimeException(e);
			}
		}
	
	
	// aws의 s3에서 사진삭제 메소드
	private void deleteFromAwsS3(String fileName) {
		System.out.println("삭제");
		System.out.println(fileName.substring(75));
		String key = fileName.substring(75);
			
		DeleteObjectRequest deleteBucketRequest;
		deleteBucketRequest = DeleteObjectRequest.builder()
				.bucket(bucketName)
				.key(key)
				.build();
			
		s3.deleteObject(deleteBucketRequest);
			
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
