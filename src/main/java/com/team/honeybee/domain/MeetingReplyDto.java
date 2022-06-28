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
	
	// 레퍼런스, 그룹 : id와 별도로 계층형 그룹 번호이다.
	private long refNum;
	// 레벨 :  들여쓰기, 처음 0으로 시작, 객층마다 1씩 증가
	private long step;
	// 같은 그룹안에 순서 0으로 시작
	private long refOrder;
	// 자식글의 갯수, 부모는 무조건 0 자식부터 1씩 증가
	private long answerNum;
	// 부모글의 기본키(id), 부모는 최상위 이므로 0으로, 자식부터 id값 가져옴 
	private long parentNum;
	
	/*
	public String getPrettyInserted() {
		// 24시간 이내면 시간만
		// 이전이면 년-월-일
		LocalDateTime now = LocalDateTime.now();
		if (now.minusHours(24).isBefore(inserted)) {
			return inserted.toLocalTime().toString();
		} else {
			return inserted.toLocalDate().toString();
		}
	}
	*/
	
}
