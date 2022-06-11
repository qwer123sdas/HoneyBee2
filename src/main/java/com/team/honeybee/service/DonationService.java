package com.team.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.team.honeybee.domain.DonationDto;
import com.team.honeybee.mapper.DonationMapper;

@Service
public class DonationService {
	@Autowired
	DonationMapper mapper;
	
	@Autowired // 비밀번호 암호화
	private BCryptPasswordEncoder passwordEncoder;
	
	// [임시] 도네이션 작성 게시판
	public void dontaionBoardWrite(DonationDto dto, String memberId) {
		mapper.dontaionBoardWrite(dto, memberId);
	}
	
	// 게시글 목록
	public List<DonationDto> findOrder() {
		return mapper.selectOrder();
	}


}
