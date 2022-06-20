package com.team.honeybee.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.team.honeybee.domain.MeetingDto;
import com.team.honeybee.mapper.MeetingMapper;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class MeetingService {
	
	@Autowired
	private MeetingMapper mapper;
	
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
	
	// 게시물 등록
	@Transactional
	public boolean insertBoard(MeetingDto meeting, MultipartFile[] files, String hashTagRaw) {
		int cnt = mapper.insertMeeting(meeting);
		System.out.println(files.length);
		System.out.println(meeting.getMeetingId());
		addFiles(meeting.getMeetingId(), files);
		hashTagInsertBoardBymeetingId(hashTagRaw, meeting.getMeetingId()); // 해쉬태그 매소드에 태그랑 아이디값 넣기
		
		return cnt == 1;
	}
	
	// 해쉬태그 분리 로직 매소드
	private void hashTagInsertBoardBymeetingId(String hashTagRaw, int meetingId) {
		
		String hashTag[] = hashTagRaw.split("#");
		for(int i = 1; i < hashTag.length; i++) {
			mapper.setHashTag(hashTag[i].replaceAll(" ", ""), meetingId);
		}
		
	}

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
	
	// s3 bucket
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
	
	/*
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
	
	// 모임 리스트(topic추가함)
	@Transactional
	public List<MeetingDto> meetingList(String sort, String topic) {
		
		return mapper.selectMeeting(sort, topic);
	}

	// 기부모임 게시물 보기
	public MeetingDto getBoardByMeetingId(int meetingId) {
		MeetingDto meeting = mapper.selectBoardByMeetingId(meetingId);
		// 해쉬태그 가져오기
		List<String> hashTag = mapper.getHashTag(meetingId);
		meeting.setHashTag(hashTag);
		return meeting;
	}

	

}
