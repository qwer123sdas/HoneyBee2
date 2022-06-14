package com.team.honeybee.domain;

import java.time.LocalDateTime;
import java.util.List;

import lombok.Data;

@Data
public class MeetingDto {
	private int meeting_id;
	private String member_id;
	
	private String title;
	private String contents;
	private String postcode;
	private String address;
	private String detailAddress;
	private String guest; 
	
	private List<String> fileName;
	
	private LocalDateTime inserted;
	private LocalDateTime start_date;
	private LocalDateTime end_date;
	private String tag;
}
