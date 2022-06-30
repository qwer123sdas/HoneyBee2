package com.team.honeybee.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.team.honeybee.domain.FavoriteDto;
import com.team.honeybee.domain.TalentBoardDto;
import com.team.honeybee.domain.TalentReivewDto;
import com.team.honeybee.service.FavoriteService;
import com.team.honeybee.service.TalentBoardService;
import com.team.honeybee.service.TalentReviewService;

@Controller
@RequestMapping("talent")
public class TalentBoardController {
	@Autowired
	TalentBoardService service;
	
	@Autowired
	TalentReviewService reviewService;
	
	@Autowired
	FavoriteService favoriteService;
	
	// 게시물 리스트 
	@RequestMapping("main")
	public void mainPage(@RequestParam(name="topic_id", defaultValue = "")String topic,
							@RequestParam(name="sort", defaultValue = "")String sort,
																		Model model) {
		// 목록 가져오기
		List<TalentBoardDto> boardList = service.findBoardList(topic, sort);
		
		model.addAttribute("topic", topic);
		model.addAttribute("sort", sort);
		model.addAttribute("boardList", boardList);
	}
	
	// 특정 게시물 보기
	@RequestMapping("board/{talentId}")
	public String boardPage(@PathVariable int talentId, Model model, Principal principal) {
		
		// 게시글 정보 가져오기
		TalentBoardDto board = service.getBoard(talentId);
		
		// 수업 항목 list로 보내기
		String classContents = board.getClassContent();
		String[] classContentList = classContents.substring(1).split("/");
		
		// 좋아요 디비에서 정보 찾기
		FavoriteDto favoriteDto = new FavoriteDto();
		favoriteDto.setType('T');
		if(principal != null) {
			System.out.println("로그인 여부 확인 : " + principal.getName());
			favoriteDto = favoriteService.findFavorite(board.getTalentId(), principal.getName(), "T");
		}
		
		int heart = 0;
		if(favoriteDto != null) {
			// 특정 계정이 하트 눌렀는지 여부 확인
			heart = favoriteDto.getHeart();
			model.addAttribute("heart", heart);
		}
		model.addAttribute("heart", heart);
		
		// 좋아요 갯수 세기
		//int count =  favoriteService.countHeart(board.getTalentId());
		//model.addAttribute("count", count);
		
		model.addAttribute("classContentList", classContentList);
		model.addAttribute("principal", principal);
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
	
	// 리뷰 작성
	@PostMapping("review")
	public String insertReivew(String reviewJson, Principal principal) {
		// json 역직렬화하고 dto에 set하기
				Gson gson = new Gson();
				TalentReivewDto dto = gson.fromJson(reviewJson, TalentReivewDto.class);
				dto.setMemberId(principal.getName());
				System.out.println(dto);
				reviewService.setTalentReview(dto);
				
		return "redirect:/talent/board/" + dto.getTalentId();
	}
	
	// 리뷰 목록 가져오기
	@PostMapping("reviewList")
	@ResponseBody
	public List<TalentReivewDto> getReivewList(int talentId) {
		return reviewService.selectReviewList(talentId);
	}
	

}
