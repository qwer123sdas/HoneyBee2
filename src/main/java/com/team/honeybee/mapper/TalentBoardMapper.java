package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.team.honeybee.domain.DonationBoardDto;
import com.team.honeybee.domain.SummerNoteDto;
import com.team.honeybee.domain.TalentBoardDto;
import com.team.honeybee.domain.TalentReivewDto;

@Mapper
public interface TalentBoardMapper {
	//게시물 리스트 가져오기
	List<TalentBoardDto> findBoardList(@Param("topic")String topic, @Param("sort")String sort);
	// 게시물 정보 가져오기
	TalentBoardDto getBoard(@Param("talentId")int talentId, @Param("memberId")String memberId);
	
	// 게시물 작성
	void setTalentBoard(TalentBoardDto dto);
	// 메인사진 db 저장
	void insertMainPhoto(@Param("talentId")int talentId, 
						 @Param("mainPhoto")String mainPhoto, 
						 @Param("memberId")String memberId,
						 @Param("folderName")String folderName);
	
	//메인 화면, 검색 목록
	List<TalentBoardDto> selectTalentBoardBySearch(String string);

	// update--------------------------------------------------------------------
	// 게시글 수정 작업
	void updateTalentBoard(TalentBoardDto dto);


	
	
	
	
	


	

}
