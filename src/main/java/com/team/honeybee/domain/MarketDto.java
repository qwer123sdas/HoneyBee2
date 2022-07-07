package com.team.honeybee.domain;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class MarketDto {
	private int marketId;
	private String memberId;
	private String nickname;
	private String title;
	private String content;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern="yyyy-MM-dd HH-mm-ss")
	private LocalDateTime inserted;
	private int price;
	private String productName;
	private String productCode;
	private int enable;
	private int viewCount;
	private String thumbNailImage;
	private List<String> fileName;
	private boolean hasFile;
}
