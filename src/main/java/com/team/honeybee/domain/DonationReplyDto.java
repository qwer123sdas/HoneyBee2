package com.team.honeybee.domain;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class DonationReplyDto {
	private int replyId;
	private int donationId;
	private String memberId;
	
	private String nickname;
	private String content;
	
	// @DateTimeFormat(iso = ISO.DATE, pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy년MM월dd일", timezone = "Asia/Seoul")
	private LocalDate inserted;
	
}
