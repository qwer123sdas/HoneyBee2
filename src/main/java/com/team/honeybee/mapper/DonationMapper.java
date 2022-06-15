package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.team.honeybee.domain.DonationDto;

@Mapper
public interface DonationMapper {
	// [임시] 작성 게시판
	void dontaionBoardWrite(DonationDto dto);
	// 메인 사진 등록
	void insertMainPhoto(@Param("donationId")int donationId, @Param("mainPhoto")String mainPhoto);
	
	
	// 게시글 목록
	List<DonationDto> selectOrder();

	// 기부 게시글 보기
	DonationDto getBoard(int donationId);
	
	
}
