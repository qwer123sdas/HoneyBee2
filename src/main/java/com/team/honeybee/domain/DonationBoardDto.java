package com.team.honeybee.domain;

import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
@Data
public class DonationBoardDto {
	private int donationId;
	
	private String memberId;
	private String nickname;
	
	private String title;
	private String content;
	
	private String topic;   // 카테고리 번호
	private List<String> hashTag; // 해쉬테그
	
	private String MPhoto;  // 메인 사진
	private List<String> image; // 서머노트 
	private String folderName;
	
	private LocalDateTime inserted;
	private String expired;
	
	private int goal;             // 목표 금액
	private int currentAmount;    // 현재 모금액

	
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
	
	// goal액수 단위 화면 표시
	public String getGoalMakedDecimalFormat() {
		DecimalFormat df = new DecimalFormat("###,###");
		return df.format(goal);
	}
	// currentAmount액수 단위 화면 표시
	public String getCurrentAmountMakedDecimalFormat() {
		DecimalFormat df = new DecimalFormat("###,###");
		return df.format(currentAmount);
	}
}
