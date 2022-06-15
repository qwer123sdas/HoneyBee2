package com.team.honeybee.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MeetingCommentDto {
	// 후기
	private int meetingCommentId;
	private int meetingId;
	private String memeberId;
	private String content;
	private LocalDateTime inserted;
}
