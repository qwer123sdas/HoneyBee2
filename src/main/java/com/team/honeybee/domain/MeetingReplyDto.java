package com.team.honeybee.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class MeetingReplyDto {
	// 댓글
	private int meetingReplyId;
	private int meetingId; // meeting
	private String memberId; // member
	private String nickname; // member
	private String content;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate inserted;
	
	// 부모 댓글
	private int meetingReplyParent;
	// 자식댓글
	private List<MeetingReplyDto> childen;
	
	
	// 깊이(부모댓글 참조갯수)
	private int deep;
	// 부모댓글 기준 그룹
	private int meetingReplyGnum;
}
