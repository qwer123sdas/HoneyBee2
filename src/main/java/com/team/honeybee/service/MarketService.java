package com.team.honeybee.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import com.team.honeybee.domain.MarketDto;
import com.team.honeybee.mapper.MarketMapper;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class MarketService {
	
	@Autowired
	public MarketMapper mapper;
	
	
	
	private S3Client s3;
	
	@Value("${aws.s3.bucketName}")
	private String bucketName;
	
	private void saveFileAwsS3(int marketId, MultipartFile file) {
		String key = "board/" + marketId + "/" + file.getOriginalFilename();
		
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
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
		
	}
	
	

	public List<MarketDto> getmarketlist() {
		return mapper.listMarket();
	}



	public MarketDto getMarketId(int id) {
		
		MarketDto market = mapper.selectMarketId(id);
		System.out.println(market);
		List<String> fileNames = mapper.selectFileNameByMarketId(id);
		System.out.println(fileNames);
		mapper.updateViewCount(id);
		market.setFileName(fileNames);
		System.out.println(market);
		return market;
	}
	



	

	
}
