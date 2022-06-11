package com.team.honeybee.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	@GetMapping("write")
	public void wirte() {

	}
	@PostMapping("write/finished")
	public String write(DonationDto dto, Principal principal) {
		System.out.println(dto.getExpired());
		String member_id = principal.getName();
		dto.setMember_id(member_id);
		service.dontaionBoardWrite(dto);
		return "donation/main";
	}

	
}
