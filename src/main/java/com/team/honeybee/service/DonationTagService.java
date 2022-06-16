package com.team.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.honeybee.domain.DonationDto;
import com.team.honeybee.mapper.DonationTagMapper;

@Service
public class DonationTagService {
	@Autowired
	DonationTagMapper mapper;
	
	//해쉬 태그 별, 게시글 가져오기
	public List<DonationDto> getDonationBoardByhashTag(String hashTag) {
		return mapper.getDonationBoardByhashTag(hashTag);
	}

	
}
