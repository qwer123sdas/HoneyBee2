package com.team.honeybee.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	// 기부 게시글 보기
	@RequestMapping("board/{donationId}")
	public String board(@PathVariable int donationId, Model model) {
		DonationDto board = service.getBoard(donationId);
		model.addAttribute("board", board);
		return "donation/board";
	}
	
	// [임시] 입력 게시판
	@GetMapping("write")
	public void wirte() {

	}
	@PostMapping("write/finished")
	public String write(DonationDto dto, Principal principal) {
		System.out.println(dto.getExpired());
		String memberId = principal.getName();
		dto.setMemberId(memberId);
		service.dontaionBoardWrite(dto);
		return "redirect:/donation/main";
	}

	
}
