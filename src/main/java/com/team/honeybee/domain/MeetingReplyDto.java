package com.team.honeybee.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MeetingReplyDto {
	// 댓글
	private int meeting_reply_id;
	private int meeting_comment_id;
	private String member_id;
	private LocalDateTime inserted;
}
