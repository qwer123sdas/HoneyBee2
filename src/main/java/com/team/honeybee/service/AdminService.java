package com.team.honeybee.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;

import com.team.honeybee.domain.DonationDto;
import com.team.honeybee.domain.FaqDto;
import com.team.honeybee.domain.MarketDto;
import com.team.honeybee.domain.MeetingDto;
import com.team.honeybee.domain.MemberDto;
import com.team.honeybee.domain.TalentDto;
import com.team.honeybee.mapper.AdminMapper;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class AdminService {

	@Autowired
	AdminMapper mapper;
	
	private S3Client s3;
	
	@Value("${aws.s3.bucketName}")
	private String bucketName;
	
	public List<MemberDto> getMember() {
		return mapper.getMember();
	}
	
	@PostConstruct
	public void init() {
		Region region = Region.AP_NORTHEAST_2;
		this.s3 = S3Client.builder().region(region).build();
	}
	
	@PreDestroy
	public void destroy() {
		this.s3.close();
	}

	public boolean updateMember(MemberDto member) {
		return mapper.modifyMember(member) == 1;
	}

	public boolean deleteMember(String memberId) {
		return mapper.deleteMember(memberId) == 1;
	}

	public List<DonationDto> getDonationList() {
		return mapper.getDonationAll();
	}
	
	public List<TalentDto> getTalentList() {
		return mapper.getTalentAll();
	}

	public List<FaqDto> getFaqList() {
		return mapper.getFaqAll();
	}

	public List<MeetingDto> getMeetingList() {
		return mapper.getMeetingAll();
	}

	@Transactional
	public boolean insertMarket(MarketDto market, MultipartFile[] files) {
		int cnt = mapper.inserMarket(market);
		
		addFiles(market.getMarketId(), files);
		
		return cnt == 1;
	}
	
	private void addFiles(int id, MultipartFile[] files) {
		// 파일 등록 
		if (files != null) {
			for (MultipartFile file : files) {
				if (file.getSize() > 0) {
					mapper.insertFile(id, file.getOriginalFilename());
					saveFileAwsS3(id, file); // s3에 업로드
				}
			}
		}
	}
	
	private void saveFileAwsS3(int id, MultipartFile file) {
		String key = "market/" + id + "/" + file.getOriginalFilename();
		
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

	public List<MarketDto> getMarketList() {
		return mapper.getMarketAll();
	}

	public MarketDto getMarketById(int id) {
		MarketDto market = mapper.selectMarketById(id);
		List<String> fileNames = mapper.selectFileNameByMarketId(id);
		
		market.setFileName(fileNames);
		System.out.println(market);
		
		return market;
	}

	@Transactional
	public boolean updateMarket(MarketDto dto, ArrayList<String> removeFileList, MultipartFile[] addFileList) {
		if (removeFileList != null) {
			for (String fileName : removeFileList) {
				deleteFromAwsS3(dto.getMarketId(), fileName);
				mapper.deleteFileByMarketIdAndFileName(dto.getMarketId(), fileName);
			}
		}
		
		if (addFileList != null) {
			// File 테이블에 추가된 파일 insert
			// s3에 upload
			addFiles(dto.getMarketId(), addFileList);
		}
		return mapper.updateMarket(dto) == 1;
	}
	
	private void deleteFromAwsS3(int id, String fileName) {
		String key = "market/" + id + "/" + fileName;
		
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
				.bucket(bucketName)
				.key(key)
				.build();
		
		s3.deleteObject(deleteObjectRequest);
	}

	@Transactional
	public boolean deleteMarket(int marketId) {
		List<String> fileList = mapper.selectFileNameByMarketId(marketId);
		removeFiles(marketId, fileList);
		int cnt = mapper.deleteMarket(marketId);
		return cnt == 1;
	}
	
	private void removeFiles(int id, List<String> fileList) {
		// s3에서 지우기
		for (String fileName : fileList) {
			deleteFromAwsS3(id, fileName);
		}
		
		// 파일테이블 삭제
		mapper.deleteFileByMarketId(id);
	}

	public DonationDto getDonation(int donationId) {
		DonationDto donation = mapper.getDonationById(donationId);
		return donation;
	}

	public MeetingDto getMeeting(int meetingId) {
		MeetingDto meeting = mapper.getMeetingById(meetingId);
		return meeting;
	}


}
