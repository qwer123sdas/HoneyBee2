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
	
	public int sumDonationAll() {
		return mapper.sumDonationAll();
	}
	
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

	// 멤버 수정
	public boolean updateMember(MemberDto member) {
		return mapper.modifyMember(member) == 1;
	}

	// 멤버 삭제
	@Transactional
	public boolean deleteMember(String memberId) {
		mapper.deleteAuthByMemberId(memberId);
		mapper.deleteMeetingCommentByMemberId(memberId);
		String fileName = mapper.selectProfileByMemberId(memberId);
		deleteFromAwsS3Memeber(memberId, fileName);
		return mapper.deleteMember(memberId) == 1;
	}

	// 기부게시글 리스트가져오기
	public List<DonationDto> getDonationList() {
		return mapper.getDonationAll();
	}
	
	// 재능판매게시글 리스트가져오기
	public List<TalentDto> getTalentList() {
		return mapper.getTalentAll();
	}

	// 1대1문의 글 리스트가져오기
	public List<FaqDto> getFaqList() {
		return mapper.getFaqAll();
	}

	// 모임게시글 리스트 가져오기
	public List<MeetingDto> getMeetingList() {
		return mapper.getMeetingAll();
	}

	// 기부마켓 등록하기
	@Transactional
	public boolean insertMarket(MarketDto market, MultipartFile[] files) {
		int cnt = mapper.inserMarket(market);
		
		addFiles(market.getMarketId(), files);
		
		return cnt == 1;
	}
	
	// 파일등록하기
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
	
	// AWS S3에 마켓관련 파일 올리기
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

	// 기부마켓 글 리스트 가져오기
	public List<MarketDto> getMarketList() {
		return mapper.getMarketAll();
	}

	// 기부마켓 글 내용보기
	public MarketDto getMarketById(int id) {
		MarketDto market = mapper.selectMarketById(id);
		List<String> fileNames = mapper.selectFileNameByMarketId(id);
		
		market.setFileName(fileNames);
		System.out.println(market);
		
		return market;
	}

	// 기부마켓 수정하기
	@Transactional
	public boolean updateMarket(MarketDto dto, ArrayList<String> removeFileList, MultipartFile[] addFileList) {
		if (removeFileList != null) {
			for (String fileName : removeFileList) {
				deleteFromAwsS3Market(dto.getMarketId(), fileName);
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
	
	// AWS S3 기부마켓관련 파일 삭제하기
	private void deleteFromAwsS3Market(int id, String fileName) {
		String key = "market/" + id + "/" + fileName;
		
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
				.bucket(bucketName)
				.key(key)
				.build();
		
		s3.deleteObject(deleteObjectRequest);
	}
	
	// AWS S3 기부게시판관련 파일 삭제하기
	private void deleteFromAwsS3Donation(String folderName, String fileName) {
		String key = "donation/" + folderName + "/" + fileName;
		
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
				.bucket(bucketName)
				.key(key)
				.build();
		
		s3.deleteObject(deleteObjectRequest);
	}
	
	// AWS S3 재능판매관련 파일 삭제하기
	private void deleteFromAwsS3Talent(String folderName, String fileName) {
		String key = "talent/" + folderName + "/" + fileName;
		
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
				.bucket(bucketName)
				.key(key)
				.build();
		
		s3.deleteObject(deleteObjectRequest);
	}
	
	// AWS S3 모임게시판관련 파일 삭제하기
	private void deleteFromAwsS3Meeting(String folderName, String fileName) {
		String key = "meeting/" + folderName + "/" + fileName;
		
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
				.bucket(bucketName)
				.key(key)
				.build();
		
		s3.deleteObject(deleteObjectRequest);
	}
	
	// ++ aws의 s3에서 summerNote에 없는 사진 삭제 메소드
	private void deleteFromAwsS3(String imageUrl) {
		System.out.println("삭제 가동");
		// 내거 75
		// 팀플 56
		System.out.println(imageUrl.substring(56));
		String key = imageUrl.substring(56);
		System.out.println(key);
		DeleteObjectRequest deleteBucketRequest;
		deleteBucketRequest = DeleteObjectRequest.builder()
				.bucket(bucketName)
				.key(key)
				.build();
		
		s3.deleteObject(deleteBucketRequest);
		
	}
	
	// AWS S3 1대1문의관련 파일 삭제하기
	private void deleteFromAwsS3Faq(int id, String fileName) {
		String key = "faq/" + id + "/" + fileName;
		
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
				.bucket(bucketName)
				.key(key)
				.build();
		
		s3.deleteObject(deleteObjectRequest);
	}
	
	// AWS S3 회원관련 파일 삭제하기
	private void deleteFromAwsS3Memeber(String id, String fileName) {
		String key = "member/" + id + "/" + fileName;
		
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
				.bucket(bucketName)
				.key(key)
				.build();
		
		s3.deleteObject(deleteObjectRequest);
	}

	// 기부마켓 글 삭제하기
	@Transactional
	public boolean deleteMarket(int marketId) {
		List<String> fileList = mapper.selectFileNameByMarketId(marketId);
		removeFiles(marketId, fileList);
		int cnt = mapper.deleteMarket(marketId);
		return cnt == 1;
	}
	
	// s3에서 기부마켓관련 파일 지우기 위한 메소드
	private void removeFiles(int id, List<String> fileList) {
		// s3에서 지우기
		for (String fileName : fileList) {
			deleteFromAwsS3Market(id, fileName);
		}
		
		// 파일테이블 삭제
		mapper.deleteFileByMarketId(id);
	}

	// 기부게시글 내용보기
	public DonationDto getDonation(int donationId) {
		DonationDto donation = mapper.getDonationById(donationId);
		return donation;
	}

	// 모임게시글 내용보기
	public MeetingDto getMeeting(int meetingId) {
		MeetingDto meeting = mapper.getMeetingById(meetingId);
		return meeting;
	}
	
	// 로그인 안한 유저, 게스트 목록 가져오기
	public List<String> selectGuestInfo(int meetingId) {
		
		return mapper.selectGuestInfo(meetingId);
	}

	// 재능판매게시글 내용보기
	public TalentDto getTalent(int talentId) {
		TalentDto talent = mapper.getTalentById(talentId);
		return talent;
	}
	
	// 1대1문의 내용보기
	public FaqDto getFaqById(int questionId) {
		FaqDto faq = mapper.getFaqById(questionId);
		List<String> fileNames = mapper.selectFileNameByFaqId(questionId);
		
		faq.setFileName(fileNames);
		return faq;
	}

	// 기부게시글 등록허용
	public void registerDonation(int donationId) {
		mapper.registerDonation(donationId);
	}

	// 재능판매게시글 등록허용
	public void registerTalent(int talentId) {
		mapper.registerTalent(talentId);
	}
	
	// 기부게시글 삭제
	@Transactional
	public void deleteDonation(int donationId) {
		DonationDto dto = mapper.selectFolderNameAndMPhotoByDonationId(donationId);
		List<String> fileNames = mapper.selectFileNameByDonationId(donationId);
		System.out.println(dto);
		deleteFromAwsS3Donation(dto.getFolderName(), dto.getMPhoto());
		for(String fileName : fileNames) {
			deleteFromAwsS3(fileName);
		}
		mapper.deleteBoardImageByDonationId(donationId);
		mapper.deleteTagByDonationId(donationId);
		mapper.deleteFavoriteByDonationId(donationId);
		mapper.deleteDonationPayByDonationId(donationId);
		mapper.deleteDonationReplyByDonationId(donationId);
		mapper.deleteDonationByDonationId(donationId);
	}

	// 재능판매게시글 삭제
	@Transactional
	public void deleteTalent(int talentId) {
		TalentDto dto = mapper.selectFolderNameAndMPhotoByTalentId(talentId);
		deleteFromAwsS3Talent(dto.getFolderName(), dto.getMPhoto());
		List<String> fileNames = mapper.selectFileNameByTalentId(talentId);
		for(String fileName :fileNames) {
			deleteFromAwsS3(fileName);
		}
		mapper.deleteBoardImageByTalentId(talentId);
		mapper.deleteTalentReviewByTalentId(talentId);
		mapper.deleteTalentByTalentId(talentId);
	}

	// 모임게시글 삭제
	@Transactional
	public void deleteMeeting(int meetingId) {
		MeetingDto dto = mapper.selectFolderNameAndMainPhotoByMeetingId(meetingId);
		deleteFromAwsS3Meeting(dto.getFolderName(), dto.getMPhoto());
		List<String> fileNames = mapper.selectFileNameByMeetingId(meetingId);
		System.out.println(fileNames);
		for(String fileName : fileNames) {
			deleteFromAwsS3(fileName);
		}
		mapper.deleteBoardImageByMeetingId(meetingId);
		mapper.deleteMeetingGuestByMeetingId(meetingId);
		mapper.deleteFavoriteByMeetingReplyId(meetingId);
		mapper.deleteMeetingReplyByMeetingId(meetingId);
		mapper.deleteTagByMeetingId(meetingId);
		mapper.deleteMeetingByMeetingId(meetingId);
	}

	// 1대1문의 글 삭제
	@Transactional
	public boolean deleteFaq(int questionId) {
		List<String> fileList = mapper.selectFileNameByFaqId(questionId);
		removeFilesFaq(questionId, fileList);
		int cnt = mapper.deleteFaqById(questionId);
		return cnt == 1;
	}
	
	// s3에서 1대1문의 파일 삭제
	private void removeFilesFaq(int questionId, List<String> fileList) {
		// s3에서 지우기
		for (String fileName : fileList) {
			deleteFromAwsS3Faq(questionId, fileName);
		}
		
		// 파일테이블 삭제
		mapper.deleteFileByFaqId(questionId);
	}

	public boolean modifyFaqEnableById(int questionId) {
		return mapper.modifyFaqEnableById(questionId);
	}




}
