package com.team.honeybee.domain;

import lombok.Data;

@Data
public class FavoriteDto {
	// favorite 테이블
	private int id;
	private String memberId;
	private int meetingId; 
	private int meetingReplyId; // 댓글 좋아요
	private int heart; // 댓글 좋아요
	
	private int count; // 좋아요 갯수
	private int cancel; // 좋아요 취소여부 판별
	
	private char type; // meeting은 'M'
}
