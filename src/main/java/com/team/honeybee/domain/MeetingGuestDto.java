package com.team.honeybee.domain;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class MeetingGuestDto {

	private int guestId; // 자동증감
	private int meetingId;
	private String memberId;
	private List<String> guest; // meetingGuest table에서 member_id로 사용중
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate inserted; // 입력날짜
	
	private int cntNum; // 현재 게스트 인원
	private int guestNum; // 게스트 인원
	private boolean own; // 신청자만 취소 가능하도록 추가함
	
}
