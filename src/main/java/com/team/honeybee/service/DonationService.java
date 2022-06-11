package com.team.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.honeybee.domain.DonationDto;
import com.team.honeybee.mapper.DonationMapper;

@Service
public class DonationService {
	@Autowired
	DonationMapper mapper;
	
	// [임시] 도네이션 작성 게시판
	public void dontaionBoardWrite(DonationDto dto) {
		mapper.dontaionBoardWrite(dto);
	}
	
	// 게시글 목록
	public List<DonationDto> findOrder() {
		return mapper.selectOrder();
	}


}
