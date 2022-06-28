package com.team.honeybee.domain;

import java.time.LocalDateTime;
import java.util.List;

import lombok.Data;

@Data
public class TalentDto {
	private int talentId;
	
	private String memberId;
	private String nickname;
	
	private String title;
	private String content;
	private String price;
	
	private LocalDateTime inserted;
	private String expired;
	
	private String MPhoto;  // 메인 사진
	private List<String> image; // 서머노트 
	private String folderName;
	
	private int mapLevel;
	private String address;
	
	private String topic;
	private int enable;
}
