package com.team.honeybee.domain;

import java.time.LocalDate;

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
	/*
	// 부모 댓글
	private int meetingReplyParent;
	// 자식댓글
	private List<MeetingReplyDto> childen;
	*/
	// 레퍼런스, 그룹 : id와 별도로 계층형 그룹 번호이다.
	private long refNum;
	// 레벨 :  들여쓰기, 처음 0으로 시작, 객층마다 1씩 증가
	private long step;
	// 같은 그룹안에 순서 0으로 시작
	private long refOrder;

	// 삭제 유무파악(DB에 저장)
	private String deleteInfo;
	
/*
	public String refineInserted() {
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
