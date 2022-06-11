package com.team.honeybee.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.honeybee.domain.DonationDto;
import com.team.honeybee.service.DonationService;

@Controller
@RequestMapping("donation")
public class DonationController {
	@Autowired
	DonationService service;
	
	// 기부게시판 목록 : 메인 화면
	@RequestMapping("main")
	public void main(Model model) {
		List<DonationDto> boardList = service.findOrder();
		model.addAttribute("boardList", boardList);
	}
	// 기부 게시판 출력
	@RequestMapping("board")
	public void board() {
		
	}
	// [임시] 입력 게시판
	@RequestMapping("write")
	public String write(DonationDto dto, Principal principal) {
		service.dontaionBoardWrite(dto, principal.getName());
		return "donation/main";
	}
	
	
}
