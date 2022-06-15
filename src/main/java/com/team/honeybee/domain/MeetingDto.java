package com.team.honeybee.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class MeetingDto{
	
	private int meetingId;
	private String memberId;
	private String nickname;
	
	private String title;
	private String content;
	private String postcode;
	private String address;
	private String detailAddress;
	private String guest; 
	
	private LocalDateTime inserted;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate startDate;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate endDate;
	private String tag;
	
	
	
	
}
