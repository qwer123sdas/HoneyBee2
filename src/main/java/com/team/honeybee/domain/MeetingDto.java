package com.team.honeybee.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MeetingDto{
	
	private int meeting_id;
	private String member_id;
	
	private String title;
	private String contents;
	private String postcode;
	private String address;
	private String detailAddress;
	private String guest; // 게스트 DB 수정해야할듯 var(20)
	
	private LocalDateTime inserted;
	private LocalDateTime start_date;
	private LocalDateTime end_date;
	
	
}
