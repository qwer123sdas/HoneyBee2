package com.team.honeybee.service;

import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


import com.team.honeybee.domain.FaqDto;
import com.team.honeybee.mapper.FaqMapper;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;



@Service
public class FaqService {
	private S3Client s3;

	@Value("${aws.s3.bucketName}")
	private String bucketName;
	
	@PostConstruct
	public void init() {
		Region region = Region.AP_NORTHEAST_2;
		this.s3 = S3Client.builder().region(region).build();

	}

	@PreDestroy
	public void destroy() {
		this.s3.close();
	}
	

	@Autowired
	private FaqMapper mapper;
	
	@Transactional
	public boolean addBoard(FaqDto faq, MultipartFile[] files) {
		faq.setMemberId("admin");
		
		int cnt = mapper.insertBoard(faq);
		
		addFiles(faq.getQuestionId(), files);
		
		return cnt == 1;
	}	
	private void addFiles(int id, MultipartFile[] files) {
		// 파일 등록
		if (files != null) {
			for (MultipartFile file : files) {
				if (file.getSize() > 0) {
					mapper.insertFile(id, file.getOriginalFilename());
					// saveFile(board.getId(),file); //desktop임시//나중에aws에
					saveFileAwsS3(id, file); // s3에 업로드
				}
			}
		}
	}
	private void saveFileAwsS3(int id, MultipartFile file) {
		String key = "faq/" + id + "/" + file.getOriginalFilename();

		PutObjectRequest putObjectRequest = PutObjectRequest.builder().acl(ObjectCannedACL.PUBLIC_READ)
				.bucket(bucketName).key(key).build();
		RequestBody requestBody;
		try {
			requestBody = RequestBody.fromInputStream(file.getInputStream(), file.getSize());
			s3.putObject(putObjectRequest, requestBody);
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}

	}

	public List<FaqDto> faqList() {
		// TODO Auto-generated method stub
		return mapper.Faqlist();
	}

	public FaqDto getFaqById(int questionId) {
		return mapper.getFaq(questionId);
		
	}

	public boolean removefaqId(int questionId) {
		// TODO Auto-generated method stub
		int cnt = mapper.deleteFaq(questionId);

		return cnt == 1;
	}

	
}
