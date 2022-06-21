package com.team.honeybee.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.honeybee.domain.TalentBoardDto;
import com.team.honeybee.service.TalentBoardService;

@Controller
@RequestMapping("talent")
public class TalentBoardController {
	@Autowired
	TalentBoardService service;
	
	// 게시물 리스트 
	@RequestMapping("main")
	public void mainPage(Model model) {
		// 목록 가져오기
		List<TalentBoardDto> boardList = service.findOrder();
		
		model.addAttribute("boardList", boardList);
	}
	
	// 특정 게시물 보기
	@RequestMapping("board/{talentId}")
	public String boardPage(@PathVariable int talentId, Model model, Principal principal) {
		// 임시
		System.out.println("로그인 여부 : " + principal.getName());
		
		// 게시글 정보 가져오기
		TalentBoardDto board = service.getBoard(talentId);
		
		model.addAttribute("board", board);
		return "talent/board";
	}
	
	@RequestMapping("write")
	public void boardWrite() {
		
	}
	
	// 게시글 작성
	@PostMapping("write")
	public String boardInput(Map<String, String> jsonByTalent, 
							 Principal principal) {
		
		System.out.println("jsonByTalent : " + jsonByTalent);
		
        // 리턴을 반환할 JSON 데이터 생성 실시
		/*
		 * dto.setTitle(String.valueOf(jsonByTalent.get("title")));
		 * dto.setContent(String.valueOf(jsonByTalent.get("content")));
		 * dto.setPrice(String.valueOf(jsonByTalent.get("price")));
		 * dto.setExpired(String.valueOf(jsonByTalent.get("expired")));
		 * dto.setTopic(String.valueOf(jsonByTalent.get("topic")));
		 * dto.setLatitude(Double.valueOf(jsonByTalent.get("latitude")));
		 * dto.setLongitude(Double.valueOf(jsonByTalent.get("longitude")));
		 * dto.setMapLevel(Integer.valueOf(jsonByTalent.get("mapLevel")));
		 */
		return "redirect:/talent/main";
	}
	

}
