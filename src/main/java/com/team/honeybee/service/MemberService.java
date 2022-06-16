package com.team.honeybee.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.bcrypt.*;
import org.springframework.stereotype.*;

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
		
		int cnt2 = mapper.insertAuth(member.getMemberId(),"ROLE_USER");
		
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
	public int findId(String name,String email) {
		return mapper.findId(name, email);
	}
	
	// 아이디 가져오기
	public String findId2(String name, String email) {
		return mapper.findId2(name, email);
	}
	// 회원 정보 불러오기
	public MemberDto memberInfo(String memberId, String name, String email, 
			String nickname, String postcode, String address, String detail, String phone) {
		return mapper.memberInfo(memberId, name, email, nickname, postcode, address, detail, phone);
	}
	
}















