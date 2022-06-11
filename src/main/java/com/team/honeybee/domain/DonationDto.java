package com.team.honeybee.domain;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class DonationDto {
	private int donationId;
	private int donationTagId;
	private String memberId;
	
	private String title;
	private String content;
	private String nickname;
	
	private LocalDateTime inserted;
	private String expired;
	
	private int goal;
	private int currentAmount;
	
	private int favorite;
	private int enable;
}
