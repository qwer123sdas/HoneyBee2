package com.team.honeybee.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class MarketDto {
	private int market_id;
	private String member_id;
	private String title;
	private String content;
	private LocalDate inserted;
	private int price;
	private String product_name;
	private int total;
	private int enable;
}
