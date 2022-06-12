package com.team.honeybee.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class faqDto {

	private int question_id;
	private String member_id;
	private String title;
	private String content;
	private LocalDateTime inserted;
	private String email;
}
