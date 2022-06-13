package com.team.honeybee.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MeetingCommentDto {
	// 후기
	private int meeting_comment_id;
	private int meeting_id;
	private String memeber_id;
	private String content;
	private LocalDateTime inserted;
}
