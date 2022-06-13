package com.team.honeybee.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.honeybee.domain.MeetingDto;
import com.team.honeybee.service.MeetingService;

@Controller
@RequestMapping("meeting")
public class MeetingController {
	
	@Autowired
	private MeetingService service;
	
	// 기부모임 메인
	@RequestMapping("main")
	public void meetingMain() {
		
	}
	
	// 기부모임 게시물 board
	@RequestMapping("board")
	public void meetingBaordList() {
		
	}
	
	// 입력위해 만듬 나중에 제안하기로 이동함
	@GetMapping("insert")
	public void insert() {
		
	}
	
	@PostMapping("insert")
	public String insert(MeetingDto meeting, 
						MultipartFile[] files, 
						Principal principal, 
						RedirectAttributes rttr) {
		
		// s3파일 담기
		if (files != null) {
			List<String> fileList = new ArrayList<String>();
			for(MultipartFile f : files) {
				fileList.add(f.getOriginalFilename());
			}
		}
		

		boolean success = service.insertBoard(meeting, files);
		
		if (success) {
			rttr.addAttribute("message", "새 글이 등록되었습니다.");
		} else {
			rttr.addAttribute("message", "새 글이 등록되지 않았습니다.");
		}
		
		return "redirect:/meeting/board" + meeting.getMeeting_id();
	}
	
	
	// 로그인 페이지 추후 삭제
	@GetMapping("login")
	public void loginPage() {
		
	}
	
}
