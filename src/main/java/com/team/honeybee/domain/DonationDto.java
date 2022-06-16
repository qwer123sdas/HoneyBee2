package com.team.honeybee.domain;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class DonationDto {
	private int donationId;
	private String memberId;
	
	private String title;
	private String content;
	private String nickname;
	private String tag;
	
	private String MPhoto;  // 메인 사진
	
	private LocalDateTime inserted;
	private String expired;
	
	private int goal;             // 목표 금액
	private int currentAmount;    // 현재 모금액
	//private int achievementRate;  // 달성률 
	
	private int favorite;  // 좋아요
	private int enable;   // 게재 권한
	
	
	// 달성률 계산
	public int getAchievementRate() {
		int result = 0;
		if(currentAmount != 0) {
			result = (int)(currentAmount * 100 / goal );
		}
		
		return result;
	}
}
