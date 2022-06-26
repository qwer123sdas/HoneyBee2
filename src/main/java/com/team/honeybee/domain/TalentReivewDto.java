package com.team.honeybee.domain;

import java.time.LocalDate;

import lombok.Data;
@Data
public class TalentReivewDto {
	private int reviewId;
	private String talentId;
	private String memberId;
	
	private String content;
	private int starRating;
	private LocalDate inserted;
	
	
}
