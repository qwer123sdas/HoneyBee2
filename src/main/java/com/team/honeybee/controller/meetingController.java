package com.team.honeybee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("meeting")
public class meetingController {
	
	// 기부모임 메인
	@RequestMapping("main")
	public void meetingMain() {
		
	}
	
	// 기부모임 게시물 board
	@RequestMapping("board")
	public void meetingBaordList() {
		
	}
	
	
}
