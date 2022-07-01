package com.team.honeybee.domain;

import lombok.Data;

@Data
public class MeetingFavorite {
	// favorite 테이블
	private int id;
	private String memberId;
	private int meetingId;
	private int heart;
}
