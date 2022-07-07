package com.team.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.honeybee.domain.TalentReivewDto;
import com.team.honeybee.mapper.TalentReviewMapper;

@Service
public class TalentReviewService {
	@Autowired
	TalentReviewMapper mapper;
	// 리뷰 작성
	public void setTalentReview(TalentReivewDto dto) {
		mapper.insertTalentReview(dto);
	}
	
	// 리뷰 목록 가져오기
	public List<TalentReivewDto> selectReviewList(int talentId) {
		return mapper.selectReviewList(talentId);
	}
}
