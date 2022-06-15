package com.team.honeybee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	// 좋아요 세기
	public int countHeart(int donationId) {
		FavoriteDto dto = mapper.countHeart(donationId);
		if(dto == null) {
			// 좋아요 누른 적이 없음
			return 0;
		}
		return dto.getCount();
				
	}
	
	// 좋아요 누를 때
	@Transactional
	public int insertFavorite(FavoriteDto dto) {
		int result = 0;
		// 좋아요 이미 있는지 확인
		FavoriteDto findDto = mapper.findFavorite(dto.getDonationId(), dto.getMemberId());
		
		
		if(findDto == null) {
			// find가 null이면 좋아요가 없으므로 정보 저장
			result = mapper.insertFavorite(dto);
		}else {
			// find가 null이 아니면 좋아요가 잇는 상태이므로 정보 삭제
			mapper.deleteFavorite(dto);
		}
		return result;
	}







}
