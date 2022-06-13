package com.team.honeybee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.honeybee.domain.FavoriteDto;
import com.team.honeybee.mapper.FavoriteMapper;

@Service
public class FavoriteService {
	@Autowired
	FavoriteMapper mapper;
	
	// 첫 로딩 페이지에서 좋아요 찾기
	public FavoriteDto findFavorite(int donationId, String memberId) {
		
		return mapper.findFavorite(donationId, memberId);
	}
	public int countHeart(int donationId) {
		return mapper.countHeart(donationId);
	}
	
	// 좋아요 누를 때
	public int insertFavorite(FavoriteDto dto) {
		int result = 0;
		// 좋아요 이미 있는지 확인
		FavoriteDto find = mapper.findFavorite(dto.getDonationId(), dto.getMemberId());
		// find가 null이면 좋아요가 없으므로 정보 저장
		// find가 null이 아니면 좋아요가 잇는 상태이므로 정보 삭제
		if(find == null) {
			result = mapper.insertFavorite(dto);
		}else {
			mapper.deleteFavorite(dto);
		}
		return result;
	}







}
