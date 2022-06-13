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
	
	private LocalDateTime inserted;
	private String expired;
	
	private int goal;
	private int currentAmount;
	
	private int favorite;
	private int enable;
}
