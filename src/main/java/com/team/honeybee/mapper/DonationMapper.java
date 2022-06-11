package com.team.honeybee.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.team.honeybee.domain.DonationDto;

@Mapper
public interface DonationMapper {
	// [임시] 작성 게시판
	void dontaionBoardWrite(DonationDto dto);
	
}
