package com.team.honeybee.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("memberTemp")
public class MemberTemp {
	
	// 로그인 상태 확인
	@RequestMapping("loginConfirm")
	@ResponseBody
	public int loginConfirm(Principal principal) {
		if(principal == null) {
			return 0;
		}else {
			return 1;
		}
	}
}
