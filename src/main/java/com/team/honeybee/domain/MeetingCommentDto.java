package com.team.honeybee.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class MeetingCommentDto {
	// 후기
	private int meetingCommentId;
	private String memberId;
	private String content;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate inserted;
}