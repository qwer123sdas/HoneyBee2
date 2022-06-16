package com.team.honeybee.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MeetingReplyDto {
	// 댓글
	private int meetingReplyId;
	private int meetingId; // meeting
	private String memberId; // member
	private String nickname; // member
	private String content;
	private LocalDateTime inserted;
	
	// 부모 댓글
	private int meetingReplyParent;
	// 깊이(부모댓글 참조갯수)
	private int deep;
	// 부모댓글 기준 그룹
	private int meetingReplyGnum;
}
