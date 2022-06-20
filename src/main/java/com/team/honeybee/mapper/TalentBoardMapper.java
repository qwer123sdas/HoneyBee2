package com.team.honeybee.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.team.honeybee.domain.TalentBoardDto;

@Mapper
public interface TalentBoardMapper {
	
	// 게시물 작성
	void setTalentBoard(TalentBoardDto dto);

}
