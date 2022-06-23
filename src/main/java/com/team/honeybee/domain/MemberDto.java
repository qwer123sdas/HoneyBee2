package com.team.honeybee.domain;

import lombok.Data;

@Data
public class MemberDto {
	
	private String memberId;
	private String pw;
	private String name;
	private String email;
	private String nickName;
	private int phone;
	private String address;
	private String detail;

	
}
