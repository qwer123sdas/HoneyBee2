package com.team.honeybee.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class TalentBoardDto {
	private int talentId;
	
	private String memberId;
	private String nickname;
	
	private String title;
	private String content;
	private String price;
	
	private LocalDateTime inserted;
	private String expired;
	
	private String MPhoto;  // 메인 사진
	private String image; // 서머노트 
	private String folderName;
	
	private int mapLevel;
	private String address;
	
	private String topic;
}
