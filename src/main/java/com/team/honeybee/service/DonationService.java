package com.team.honeybee.service;

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

}
