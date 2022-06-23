package com.team.honeybee.domain;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class FaqDto {

	private int questionId;
	private String memberId;
	private String title;
	private String content;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern="yyyy-MM-dd HH-mm-ss")
	private LocalDateTime inserted;
	private String email;
	private String thumbNailImage;
	private List<String> fileName;
	private int enable;
}
