package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.team.honeybee.domain.DonationDto;

@Mapper
public interface DonationMapper {
	// [임시] 작성 게시판
	void dontaionBoardWrite(DonationDto dto, String memberId);
	
	// 게시글 목록
	List<DonationDto> selectOrder();

	
}
