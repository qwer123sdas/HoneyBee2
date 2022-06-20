package com.team.honeybee.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class FaqDto {

	private int questionId;
	private String memberId;
	private String title;
	private String content;
	private LocalDateTime inserted;
	private String email;
	private int enable;
}
