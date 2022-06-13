package com.team.honeybee.domain;

import lombok.Data;

@Data
public class FavoriteDto {
	private int id;
	private String memberId;
	private int donationId;
	private int heart;
	
	private int count;
	private int exit;
	
	
}
