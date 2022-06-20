package com.team.honeybee.controller;

import java.security.Principal;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.JsonObject;
import com.team.honeybee.domain.TalentBoardDto;
import com.team.honeybee.service.TalentBoardService;

@Controller
@RequestMapping("talent")
public class TalentBoardController {
	@Autowired
	TalentBoardService service;
	@RequestMapping("main")
	public void mainPage(Principal principal) {
		// 임시
		System.out.println("로그인 여부 : " + principal.getName());
		
	}
	
	@RequestMapping("board")
	public void boardPage() {
		
	}
	
	@RequestMapping("write")
	public void boardWrite() {
		
	}
	@PostMapping("write")
	public String boardInput(@RequestBody Map<String, String> param, 
							 Principal principal) {
		TalentBoardDto dto = new TalentBoardDto();
		
		System.out.println("param : " + param);
		
        // 리턴을 반환할 JSON 데이터 생성 실시
		dto.setTitle(String.valueOf(param.get("title")));
		dto.setContent(String.valueOf(param.get("content")));
		dto.setPrice(String.valueOf(param.get("price")));
		dto.setExpired(String.valueOf(param.get("expired")));
		dto.setTopic(String.valueOf(param.get("topic")));
		dto.setLatitude(Double.valueOf(param.get("latitude")));
		dto.setLongitude(Double.valueOf(param.get("longitude")));
		dto.setMapLevel(Integer.valueOf(param.get("mapLevel")));
		dto.setMemberId(principal.getName());
		
		service.setTalentBoard(dto);
		return "redirect:/talent/main";
	}
}
