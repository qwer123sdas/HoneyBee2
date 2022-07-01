package com.team.honeybee.service;

import java.io.IOException;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.team.honeybee.domain.MeetingSummerNoteDto;
import com.team.honeybee.mapper.MeetingSummerNoteMapper;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class MeetingSummerNoteService {
	
	@Autowired
	private MeetingSummerNoteMapper mapper;
	
	// s3 bucket
	private S3Client amazonS3; 
	
	// 내꺼 aws String myAwsS3 = "https://bucket0207-0811.s3.ap-northeast-2.amazonaws.com";
	
	// 팀장님
	private final String awsS3Url = "https://bucket0207-4885.s3.ap-northeast-2.amazonaws.com/"; 
	
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
	

	public String uploadSummernoteMeetingImageFile(MultipartFile multipartImage, String folderId, String memberId) {
		// s3에 등록
		if(multipartImage.getSize() > 0) {
			// 중복방지 파일명 전환, return 값은 바뀐 파일명
			String savedImageName = summerNoteUploadImageName(multipartImage); 
					
			String imageUrl = saveTextAreaPhotoAwsS3(memberId, multipartImage, savedImageName, folderId);
			System.out.println("imageUrl " + imageUrl);
			return imageUrl;
			}
		
			return "";
	
	}
		// 서머노트 사진 등록 메소드
		private String saveTextAreaPhotoAwsS3(String memberId, MultipartFile multipartImage, String savedImageName, String folderId) {
			MeetingSummerNoteDto SND = new MeetingSummerNoteDto();
			System.out.println(memberId);
			
			SND.setMemberId(memberId); 
			SND.setImageName(savedImageName);
			SND.setImageFolderId(folderId);
			
			// db에 위 3가지 정보 저장
			mapper.insertImage(SND);  
			System.out.println(SND.getImageId());
			
			String key = "meeting/" + folderId + "/" + savedImageName;
			
			
			PutObjectRequest putObjectRequest = PutObjectRequest.builder()
					.acl(ObjectCannedACL.PUBLIC_READ) 		 
					.bucket(bucketName) 					
					.key(key)							
					.build(); 								 
			
			RequestBody requestBody;
			System.out.println(SND.getImageId());
			try {
				// image_url만 저장
				System.out.println(awsS3Url + key);
				mapper.uploadImageUrl(awsS3Url + key, SND.getImageId());
				requestBody = RequestBody.fromInputStream(multipartImage.getInputStream(), multipartImage.getSize());
				System.out.println(SND.getImageId());
				// s3에 저장
				amazonS3.putObject(putObjectRequest, requestBody);
				
				return key;
				
			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException(e); 
			}
			
		}
		
		public String summerNoteUploadImageName(MultipartFile file) {
			// 이름의 겹치치 않게 파일명 전환
			String originalFileName = file.getOriginalFilename(); //오리지날 파일명
			//파일 확장자
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	
			//저장될 파일명
			String savedFileName = UUID.randomUUID() + extension;	
			
			return savedFileName;
		}


}
