package com.team.honeybee.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.team.honeybee.domain.TalentBoardDto;

@Mapper
public interface OrderMapper {

	// 구매할 게시판 정보를 결제 페이지로 보내기
	TalentBoardDto selectTalentBoard(int talentId);

}
