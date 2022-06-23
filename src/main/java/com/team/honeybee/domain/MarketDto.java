package com.team.honeybee.domain;

import java.time.LocalDate;
import java.util.List;

import lombok.Data;

@Data
public class MarketDto {
	private int marketId;
	private String memberId;
	private String nickname;
	private String title;
	private String content;
	private LocalDate inserted;
	private int price;
	private String productName;
	private int total;
	private int enable;
	private int viewCount;
	private String thumbNailImage;
	private List<String> fileName;
	private boolean hasFile;
}