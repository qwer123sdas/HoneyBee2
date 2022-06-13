package com.team.honeybee.service;

import java.io.File;
import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
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
	
	@PreDestroy
	public void destory() {
		this.s3.close();
	}

	public boolean insertBoard(MeetingDto meeting, MultipartFile[] files) {
		int cnt = mapper.insertMeeting(meeting);
		
		addFiles(meeting.getMeeting_id(), files);
		
		return cnt == 1;
	}
	
	// 파일 여러개
	private void addFiles(int meeting_id, MultipartFile[] files) {
		if (files != null) {
			for (MultipartFile file : files) {
				if (file.getSize() > 0) {
					mapper.insertFile(meeting_id, file.getOriginalFilename());
					saveFileAwsS3(meeting_id, file);
				}
	
			}
		}
		
	}
	
	// s3 bucket
	private void saveFileAwsS3(int meeting_id, MultipartFile file) {
		
		String key = "meeting/" + meeting_id + "/" + file.getOriginalFilename();
		
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
	
	// 파일 저장 메소드
	private void saveFile(int meeting_id, MultipartFile file) {
	
		String pathStr = "C:/imgtmp/board/" + meeting_id + "/";
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

}
