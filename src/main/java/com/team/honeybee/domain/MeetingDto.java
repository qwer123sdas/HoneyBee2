package com.team.honeybee.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

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

	private String topic; // 카테고리 번호
	private List<String> hashTag; // 해쉬태그 hash_tag
	
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate inserted;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate meetingDate; // 모임 날짜
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate startDate; // 모집 시작일
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate endDate; // 모임 종료일
	private String tag;
	private int enable;
	private String mainPhoto;  // 메인 사진
	private List<String> image; // 서머노트 
	private String folderName;


	
	
	
}