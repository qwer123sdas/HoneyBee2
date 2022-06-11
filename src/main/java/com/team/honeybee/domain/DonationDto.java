package com.team.honeybee.domain;

import java.time.LocalDateTime;

import lombok.Data;
@Data
public class DonationDto {
	private int donation_id;
	private int donation_tag_id;
	
	private String title;
	private String content;
	
	private LocalDateTime inserted;
	private LocalDateTime expired;
	
	private int goal;
	private int current_amount;
	
	private int favorite;
	private int enable;
}
