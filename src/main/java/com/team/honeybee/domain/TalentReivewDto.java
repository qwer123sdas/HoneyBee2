package com.team.honeybee.domain;

import java.time.LocalDate;

import lombok.Data;
@Data
public class TalentReivewDto {
	private int reviewId;
	private String talentId;
	
	private String memberId;
	private String nickname;
	
	private String content;
	private int starRating;
	
	private LocalDate inserted;
	
	private int refOrder;
	
	// db에 없음
    private int starCount;
	private int starSum;
	
	
}
