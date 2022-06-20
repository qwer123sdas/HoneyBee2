package com.team.honeybee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.honeybee.domain.TalentBoardDto;
import com.team.honeybee.mapper.TalentBoardMapper;

@Service
public class TalentBoardService {
	@Autowired
	TalentBoardMapper mapper;
	
	public void setTalentBoard(TalentBoardDto dto) {
		mapper.setTalentBoard(dto);
	}

}
