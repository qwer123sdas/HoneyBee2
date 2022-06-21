package com.team.honeybee.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.bcrypt.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.team.honeybee.domain.*;
import com.team.honeybee.mapper.*;

@Service
public class MemberService {

	@Autowired
	private MemberMapper mapper;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

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
	public boolean modifyMember(MemberDto dto, String oldPw) {
		// DB에서 member 읽어오기
		MemberDto oldMember = mapper.memberInfo(dto.getMemberId());

		dto.setPw(oldMember.getPw());
		return mapper.updateMember(dto) == 1;

	}

	// 회원 비밀번호 초기화
	public void initPw(String memberId) {
		String pw = passwordEncoder.encode(memberId);
		mapper.initPwByMemberId(memberId, pw);
	}
	
	// 회원 비밀번호 변경
	public boolean changePw(MemberDto dto) {
		String encodedPassword = passwordEncoder.encode(dto.getPw());
		
		dto.setPw(encodedPassword);
		
		return mapper.changePw(dto);
	}

	public String getEmailById(String memberId) {
		return mapper.selectEmailById(memberId);
	}
}
