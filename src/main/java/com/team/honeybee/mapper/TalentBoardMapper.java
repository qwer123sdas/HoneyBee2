package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.honeybee.domain.SummerNoteDto;
import com.team.honeybee.domain.TalentBoardDto;

@Mapper
public interface TalentBoardMapper {
	// 게시물 리스트 가져오기
	List<TalentBoardDto> findOrder();

	// 게시물 정보 가져오기
	TalentBoardDto getBoard(int talentId);
	
	// 게시물 작성
	void setTalentBoard(TalentBoardDto dto);


	

}
