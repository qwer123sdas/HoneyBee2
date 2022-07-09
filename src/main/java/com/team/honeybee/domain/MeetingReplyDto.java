package com.team.honeybee.domain;


import java.time.LocalDate;
import java.time.LocalDateTime;

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
	// 레퍼런스, 그룹 : id와 별도로 계층형 그룹 번호이다.
	private long refNum;
	// 레벨 :  들여쓰기, 처음 0으로 시작, 객층마다 1씩 증가
	private long step;
	// 같은 그룹안에 순서 0으로 시작
	private long refOrder;
	// 삭제 유무파악(DB에 저장)
	private String deleteInfo;
	
	// 댓글별 좋아요 갯수
	private int favoriteCount; // 좋아요 디비
	
	private boolean own; 



}
