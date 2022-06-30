package com.team.honeybee.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.team.honeybee.domain.FavoriteDto;

@Mapper
public interface FavoriteMapper {
	// Donation 좋아요 있는지 DB에서 찾기
	FavoriteDto findFavoriteFromDonation(@Param("donationId")int donationId, @Param("memberId")String memberId);
	// Talent 페이지에서 찜하기 있는지 DB에서 찾기
	FavoriteDto findFavoriteFromTalentId(@Param("talentId")int talentId, @Param("memberId")String memberId);
	
	// Donation 좋아요 넣기
	int insertFavoriteFromDonation(FavoriteDto dto);
	// Talent 좋아요 넣기
	int insertFavoriteFromTalent(FavoriteDto dto);
	
	// Donation좋아요 삭제
	void deleteFavoriteFromDonation(FavoriteDto dto);
	// Talent 좋아요 삭제
	void deleteFavoriteFromTalent(FavoriteDto dto);
	
	// 좋아요 총 갯수 세기
	FavoriteDto countHeart(int donationId);
	



}
