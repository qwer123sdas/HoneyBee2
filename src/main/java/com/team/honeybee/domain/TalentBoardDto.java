package com.team.honeybee.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class TalentBoardDto {
	private String memberId;
	private String nickname;
	
	private int talentId;
	private String title;
	private String content;
	private String price;
	
	private LocalDateTime inserted;
	private String expired;
	
	private String imageName;
	private String imageUrl;
	private String imageFolderId;
	
	private double latitude; 
	private double longitude;
	private int mapLevel;
	private String address;
	
	private String topic;
}
