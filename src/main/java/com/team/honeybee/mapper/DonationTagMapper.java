package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.honeybee.domain.DonationDto;

@Mapper
public interface DonationTagMapper {
	//해쉬 태그 별, 게시글 가져오기
	List<DonationDto> getDonationBoardByhashTag(String hashTag);

}
