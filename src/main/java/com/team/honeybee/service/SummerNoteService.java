package com.team.honeybee.service;

import java.io.File;
import java.io.IOException;
import java.util.Random;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.team.honeybee.domain.DonationDto;
import com.team.honeybee.domain.SummerNoteDto;
import com.team.honeybee.mapper.SummerNoteMapper;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class SummerNoteService {
	@Autowired
	SummerNoteMapper mapper;
	
	@org.springframework.beans.factory.annotation.Value("${aws.s3.bucketName}")
	private String bucketName;
	
	private S3Client amazonS3; 
	
	private final String awsS3Url = "https://bucket0207-spring0520-teacher-test.s3.ap-northeast-2.amazonaws.com/"; // 내꺼
	
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

	
	// 서머노트 이미지 저장
	public String uploadImageToS3ForSummerNote(MultipartFile multipartImage, String folderId, String memberId) {
		
		// 파일 s3에 등록
		if(multipartImage.getSize() > 0) {
			// 이름의 겹치치 않게 파일명 전환, return 값은 바뀐 파일명
			String savedImageName = summerNoteUploadImageName(multipartImage); 
			
			String imageUrl = saveTextAreaPhotoAwsS3(memberId, multipartImage, savedImageName, folderId);
			return imageUrl;
		}
		return "";
		
	}
	
	// 서머노트 사진 등록 메소드
	private String saveTextAreaPhotoAwsS3(String memberId, MultipartFile multipartImage, String savedImageName, String folderId) {
		SummerNoteDto SND = new SummerNoteDto();
		SND.setMemberId(memberId);
		SND.setImageName(savedImageName);
		SND.setImageFolderId(folderId);
		// db에 위 3가지 정보 저장
		mapper.insertImage(SND);  
		
		String key = "donation/image/temp/" + folderId + "/" + savedImageName;
		
		
		PutObjectRequest putObjectRequest = PutObjectRequest.builder()
				.acl(ObjectCannedACL.PUBLIC_READ) 		 // acl : 권한 설정
				.bucket(bucketName) 					// bucket 위치 설정
				.key(key)								// 키
				.build(); 								 // 이를 통해 PutObjectRequest객체 만듬
		
		RequestBody requestBody;
		
		try {
			// image_url만 저장
			mapper.uploadImageUrl(awsS3Url + key, SND.getImageId());
			requestBody = RequestBody.fromInputStream(multipartImage.getInputStream(), multipartImage.getSize());
			
			// s3에 저장
			amazonS3.putObject(putObjectRequest, requestBody);
			
			return key;
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e); // 트랜잭션 때문에 모두 실패????????????
		}
	}
	
	public String summerNoteUploadImageName(MultipartFile file) {
		// 이름의 겹치치 않게 파일명 전환
		String originalFileName = file.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		return savedFileName;
	}

}
