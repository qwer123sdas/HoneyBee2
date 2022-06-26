package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.team.honeybee.domain.SummerNoteDto;
import com.team.honeybee.domain.TalentBoardDto;
import com.team.honeybee.domain.TalentReivewDto;

@Mapper
public interface TalentBoardMapper {
	// 게시물 리스트 가져오기
	List<TalentBoardDto> findOrder();

	// 게시물 정보 가져오기
	TalentBoardDto getBoard(int talentId);
	
	// 게시물 작성
	void setTalentBoard(TalentBoardDto dto);
	// 메인사진 db 저장
	void insertMainPhoto(@Param("talentId")int talentId, 
						 @Param("mainPhoto")String mainPhoto, 
						 @Param("memberId")String memberId,
						 @Param("folderName")String folderName);
	
	// 리뷰 작성
	void insertTalentReview(TalentReivewDto dto);


	

}
