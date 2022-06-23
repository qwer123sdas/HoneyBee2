package com.team.honeybee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.honeybee.domain.TalentBoardDto;
import com.team.honeybee.mapper.OrderMapper;

@Service
public class OrderService {
	@Autowired
	OrderMapper mapper;

	
	// 구매할 게시판 정보를 결제 페이지로 보내기
	public TalentBoardDto selectTalentBoard(int talentId) {
		return mapper.selectTalentBoard(talentId);
	}
	

}
