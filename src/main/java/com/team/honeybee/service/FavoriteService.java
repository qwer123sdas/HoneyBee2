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
	
	// Donation, Talent 페이지에서 좋아요 찾기
	public FavoriteDto findFavorite(int boardId, String memberId, String boardType) {
		if(boardType =="D") {
			return mapper.findFavoriteFromDonation(boardId, memberId);
		}
		return mapper.findFavoriteFromTalentId(boardId, memberId);
		
	}
	
	
	// Donation 좋아요 누를 때
	@Transactional
	public int insertFavorite(FavoriteDto dto) {
		int result = 0;
		FavoriteDto findDto;
		// 좋아요 이미 있는지 확인(D - donation, T - Talent)
		System.out.println(dto.getType() == 'D');
		if(dto.getType() == 'D') {
			findDto = mapper.findFavoriteFromDonation(dto.getDonationId(), dto.getMemberId());
		}else {
			findDto = mapper.findFavoriteFromTalentId(dto.getTalentId(), dto.getMemberId());
		}
		System.out.println("find : " + dto);
		System.out.println(findDto);
		
		if(findDto == null) {
			// find가 null이면 좋아요가 없으므로 정보 저장
			System.out.println(dto.getType());
			if(dto.getType() == 'D') {
				System.out.println("D 인설트");
				result = mapper.insertFavoriteFromDonation(dto);
			}else {
				System.out.println("T 인설트");
				result = mapper.insertFavoriteFromTalent(dto);
			}
		}else {
			// find가 null이 아니면 좋아요가 잇는 상태이므로 정보 삭제
			if(dto.getType() == 'D') {
				System.out.println("D 딜리트");
				mapper.deleteFavoriteFromDonation(dto);
			}else {
				System.out.println("T 딜리트");
				mapper.deleteFavoriteFromTalent(dto);
			}
			
		}
		return result;
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









}
