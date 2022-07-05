package com.team.honeybee.domain;

import java.time.*;

import org.springframework.format.annotation.*;
import org.springframework.format.annotation.DateTimeFormat.*;

import lombok.*;

@Data
public class MemberDto {
	private String memberId;
	private String pw;
	private String name;
	private String email;
	private String nickname;
	private String profile;
	private String postcode;
	private String address;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate birth;
	private String phone;
	private String detail;
	
	// db에 없는 것
	private int totalPoint;
	
}
