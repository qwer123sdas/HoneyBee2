package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.team.honeybee.domain.DonationBoardDto;

@Mapper
public interface DonationBoardMapper {
	// [임시] 작성 게시판
	void dontaionBoardWrite(DonationBoardDto dto);
	// 해쉬 태그 넣기
	void setHashTag(@Param("hashTag")String hashTag, @Param("donationId")int donationId);
	
	// 메인 사진 등록
	void insertMainPhoto(@Param("donationId")int donationId, 
						 @Param("mainPhoto")String mainPhoto, 
						 @Param("memberId")String memberId,
						 @Param("folderName")String folderName);
	
	
	// 게시글 목록 + topic 과 등록순 
	List<DonationBoardDto> selectOrder(@Param("sort")String sort, @Param("topic")String topic);

	// 기부 게시글 보기(로그인 여부 구별)
	DonationBoardDto getBoard(@Param("donationId")int donationId, @Param("memberId")String memberId);
	// 해쉬태그 가져오기
	List<String> getHashTag(int donationId);
	
	// 메인 화면, 검색 목록
	List<DonationBoardDto> selectDonationBoardBySearch(String keyword);
	
	// 게시글 수정
	void updateDonationBoard(DonationBoardDto dto);
	

	
	
}
