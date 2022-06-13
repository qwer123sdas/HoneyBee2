package com.team.honeybee.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.team.honeybee.domain.FavoriteDto;

@Mapper
public interface FavoriteMapper {
	// 좋아요 있는지 DB 확인
	FavoriteDto findFavorite(@Param("donationId")int donationId, @Param("memberId")String memberId);
	// 좋아요 넣기
	int insertFavorite(FavoriteDto dto);
	// 좋아요 삭제
	void deleteFavorite(FavoriteDto dto);
	// 좋아요 총 갯수 세기
	int countHeart(int donationId);

}
