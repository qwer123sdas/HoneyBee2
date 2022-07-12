package com.team.honeybee.service;

import java.io.*;
import java.util.*;

import javax.annotation.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.bcrypt.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.web.multipart.*;

import com.team.honeybee.domain.*;
import com.team.honeybee.mapper.*;

import software.amazon.awssdk.core.sync.*;
import software.amazon.awssdk.regions.*;
import software.amazon.awssdk.services.s3.*;
import software.amazon.awssdk.services.s3.model.*;

@Service
public class MemberService {

	private S3Client s3;

	@Value("${aws.s3.bucketName}")
	private String bucketName;

	@Autowired
	private MemberMapper mapper;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@PostConstruct
	public void init() {
		Region region = Region.AP_NORTHEAST_2;
		this.s3 = S3Client.builder().region(region).build();
	}

	@PreDestroy
	public void destroy() {
		this.s3.close();
	}

	public boolean addMember(MemberDto member) {

		String encodedPassword = passwordEncoder.encode(member.getPw());

		member.setPw(encodedPassword);

		int cnt1 = mapper.insertMember(member);

		int cnt2 = mapper.insertAuth(member.getMemberId(), "ROLE_USER");

		return cnt1 == 1 && cnt2 == 1;
	}

	// 아이디 중복확인
	public boolean hasMemberId(String memberId) {
		return mapper.countMemberId(memberId) > 0;
	}

	// 이메일 중복확인
	public boolean hasMemberEmail(String email) {
		return mapper.countMemberEmail(email) > 0;
	}

	// 닉네임 중복확인
	public boolean hasMemberNickName(String nickname) {
		return mapper.countMemberNickName(nickname) > 0;
	}

	// 아이디 찾기
	public int findId(String name, String email) {
		return mapper.findId(name, email);
	}

	// 아이디 가져오기
	public String findId2(String name, String email) {
		return mapper.findId2(name, email);
	}

	// 회원 정보 불러오기
	public MemberDto memberInfo(String memberId) {
		return mapper.memberInfo(memberId);
	}

	// 회원 탈퇴
	@Transactional
	public boolean removeMember(MemberDto dto) {
		MemberDto member = mapper.memberInfo(dto.getMemberId());

		String rawPw = dto.getPw();
		String encodePw = member.getPw();

		if (passwordEncoder.matches(rawPw, encodePw)) {
			// 저장된 프로필 사진 폴더 포함 삭제
			if (dto.getProfile() != null && dto.getProfile().isEmpty()) {
				String folder = "${imageUrl}/member/" + dto.getMemberId() + "/";
				String path = folder + dto.getProfile();

				File file = new File(path);
				file.delete();

				File dir = new File(folder);
				dir.delete();

			}
			// 댓글 삭제 넣어야함

			// 이 멤버가 쓴 게시글 삭제 넣어야함

			// 권한 테이블 삭제
			mapper.deleteAuthById(dto.getMemberId());

			// 멤버 테이블 삭제
			int cnt = mapper.deleteMemberById(dto.getMemberId());
			return cnt == 1;
		}

		return false;
	}

	// 회원 정보 수정
	@Transactional
	public boolean modifyMember(MemberDto dto, String oldPw) {
		// DB에서 member 읽어오기
		MemberDto oldMember = mapper.memberInfo(dto.getMemberId());
		
		int cnt = 0;
		String encodedPW = oldMember.getPw();
		System.out.println(encodedPW);
		
		if(passwordEncoder.matches(oldPw, encodedPW)) {			
			dto.setPw(oldMember.getPw());
			System.out.println(dto);
			cnt = mapper.updateMember(dto);
		}
 
//		// 프로필 사진 업로드
//		if (profile.getSize() > 0) {
//			mapper.updateFile(dto.getMemberId(), profile.getOriginalFilename());
//			saveProfile(dto.getMemberId(), profile);
//		}

		return cnt == 1;

	}

	// 프로필 사진 저장
	private void saveProfile(String memberId, MultipartFile profile) {
		// 디렉토리
		saveFileAwsS3(memberId, profile);
	}

	private void saveFileAwsS3(String id, MultipartFile file) {
		String key = "member/" + id + "/" + file.getOriginalFilename();
		
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
	// 이메일을 이용한 비밀번호 찾기
	public void initPw(String memberId) {
		String pw = passwordEncoder.encode(memberId);
		mapper.initPwByMemberId(memberId, pw);
	}

	public String getEmailById(String memberId) {
		return mapper.selectEmailById(memberId);
	}

	// 마이페이지에서 회원 비밀번호 변경
	public boolean updatePw(String memberId, String pw, String newPw) {
		MemberDto oldMember = mapper.selectMemberById(memberId);

		String encodedPw = oldMember.getPw();
		if (passwordEncoder.matches(pw, encodedPw)) {

			// 암호 인코딩
			String encodedPassword = passwordEncoder.encode(newPw);

			return mapper.updatePw(memberId, encodedPassword);
		}

		return false;
	}

	public void changePw(String memberId, String newPw) {
		String encodedPw = passwordEncoder.encode(newPw);
		mapper.updatePw(memberId, encodedPw);
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
	
	//상담내용 리스트 가져오기
	public List<FaqDto> faqList(String memberId) {
		// TODO Auto-generated method stub
		return mapper.Faqlist(memberId);
	}

	@Transactional
	//상담내용 제거
	public boolean removefaqId(int questionId) {
		List<String> fileList = mapper.selectFileNameById(questionId);

		removeFiles(questionId, fileList);

		int cnt = mapper.deleteFaq(questionId);

		return cnt == 1;
	}

	private void removeFiles(int id, List<String> fileList) {
		// s3에서 지우기
		for (String fileName : fileList) {
			deleteFormAwsS3(id, fileName);
		}

		// 파일 테이블 삭제
		mapper.deleteFileById(id);
	}
	
	//상담내용 사진 삭제
	private void deleteFormAwsS3(int id, String fileName) {
		String key = "faq/" + id + "/" + fileName;

		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder().bucket(bucketName).key(key).build();

		s3.deleteObject(deleteObjectRequest);

	}
	
    //상담 내용 불러오기
	public FaqDto getFaqById(int questionId) {
		FaqDto faq = mapper.getFaq(questionId);
		List<String> fileNames = mapper.selectFileNameById(questionId);
		faq.setFileName(fileNames);
		return faq;
	}
	
	// 기부 게시글
	public List<DonationBoardDto> getDonationByMemberId(String memberId) {
		return mapper.getDonationByMemberId(memberId);
	}

	// 재능기부 게시글
	public List<TalentBoardDto> getTalentByMemberId(String memberId) {
		return mapper.getTalentByMemberId(memberId);
	}

	// 모임 게시글
	public List<MeetingDto> getMeetingByMemberId(String memberId) {
		return mapper.getMeetingByMemberId(memberId);
	}

	public List<DonationReplyDto> getDonationReplyByMemberId(String memberId) {
		return mapper.getDonationReplyByMemberId(memberId);
	}

	public List<MeetingCommentDto> getMeetingCommentByMemberId(String memberId) {
		return mapper.getMeetingCommentByMemberId(memberId);
	}

	public boolean deleteDonationReplyByReplyId(String replyId) {
		mapper.deleteDonationPayByReplyId(replyId);
		return mapper.deleteDonationReplyByReplyId(replyId);
	}

	public boolean deleteMeetingCommentByMeetingCommentId(String meetingCommentId) {
		return mapper.deleteMeetingCommentByMeetingCommentId(meetingCommentId);
	}
		//구매 리스트 불러오기
		public List<OrderPayDto> payList(String memberId) {
			// TODO Auto-generated method stub
			return mapper.paylist(memberId);
		}
		//구매 리스트 내용 불러오기
		public OrderPayDto payGet(int orderId) {
			// TODO Auto-generated method stub
			return mapper.payget(orderId);
		}

		public MarketDto getMarket(String productCode) {
			return mapper.selectMarket(productCode);
		}

		public int countMember() {
			return mapper.countMember();
		}

		public TalentBoardDto getTalent(String productCode) {
			return mapper.selectTalent(productCode);
		}
}
