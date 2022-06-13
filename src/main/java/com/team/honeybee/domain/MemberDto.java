package com.team.honeybee.domain;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class MemberDto {
	private String memberId;
	private String pw;
	private String name;
	private String email;
	private String nickname;
	private String postcode;
	private String address;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate birth;
	private String phone;
	private String detail;
	
}
