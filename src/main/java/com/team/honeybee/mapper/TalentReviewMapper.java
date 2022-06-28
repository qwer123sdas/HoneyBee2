package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.honeybee.domain.TalentReivewDto;

@Mapper
public interface TalentReviewMapper {
	// 리뷰 작성
	void insertTalentReview(TalentReivewDto dto);
	
	// 리뷰 목록 가져오기
	List<TalentReivewDto> selectReviewList(int talentId);
}
