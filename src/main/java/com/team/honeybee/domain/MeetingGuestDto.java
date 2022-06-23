package com.team.honeybee.domain;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class MeetingGuestDto {

	private int guestId;
	private int meetingId;
	private String memberId;
	private String guest;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate inserted;
	
}
