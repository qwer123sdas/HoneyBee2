package com.team.honeybee.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
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
		/*
		List<List<String>> mainCategory = new ArrayList<List<String>>();
		List<String> mainCategoryName = new ArrayList<String>();
		mainCategoryName.add("스포츠");
		mainCategoryName.add("공연");
		mainCategory.add(mainCategoryName);
		
		List<Map<Integer, String>> subCategory01 = new ArrayList<Map<Integer,String>>();
		Map<Integer, String> subCategoryName01 = new HashMap<Integer, String>();
		subCategoryName.put(1, "야구");
		subCategoryName.put(1, "축구");
		
		
		List<Map<Integer, String>> subCategory02 = new ArrayList<Map<Integer,String>>();
		Map<Integer, String> subCategoryName02 = new HashMap<Integer, String>();
		subCategoryName.put(1, "야구");
		subCategoryName.put(1, "축구");
		*/
	}
	
	// 게시글 작성
	@PostMapping("write")
	public String boardInput(String jsonByTalent,
							MultipartFile mainPhoto,
							String folderName, 
							Principal principal) {
		// json 역직렬화하고 dto에 set하기
		Gson gson = new Gson();
		TalentBoardDto dto = gson.fromJson(jsonByTalent, TalentBoardDto.class);
		dto.setMemberId(principal.getName());
	
		service.setTalentBoard(dto, mainPhoto, folderName);
		
		return "redirect:/talent/main";
	}
	

}
