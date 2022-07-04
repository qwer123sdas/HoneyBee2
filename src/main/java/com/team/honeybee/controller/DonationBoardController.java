package com.team.honeybee.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.team.honeybee.domain.DonationBoardDto;
import com.team.honeybee.domain.FavoriteDto;
import com.team.honeybee.service.DonationBoardService;
import com.team.honeybee.service.FavoriteService;

@Controller
@RequestMapping("donation")
public class DonationBoardController {
	@Autowired
	DonationBoardService service;
	@Autowired
	FavoriteService favoriteService;
	

	// 기부게시판 목록 : 메인 화면
	// topic에 따른 분류
	@RequestMapping("main")
	public void main(@RequestParam(name="sort", defaultValue = "")String sort,
					 @RequestParam(name="topic_id", defaultValue = "")String topic,
																	 Model model) {
		// 목록 가져오기
		List<DonationBoardDto> boardList = service.findOrder(sort, topic);
		
		// 기부금액 달성률
		model.addAttribute("boardList", boardList);
		model.addAttribute("topic", topic);
		model.addAttribute("sort", sort);
	}
	
	// 기부 게시글 보기
	@RequestMapping("board/{donationId}")
	@Transactional
	public String board(@PathVariable int donationId, Model model, Principal principal) {
		// 게시글 정보 가져오기
		DonationBoardDto board;
		if(principal == null) {
			// 로그인 x
			board = service.getBoardByBoardId(donationId);
		}else {
			// 로그인 o
			board = service.getBoardWithOwnByBoardId(donationId, principal.getName());
		}
		model.addAttribute("board", board);
		model.addAttribute("principal", principal);
		
		// 좋아요 디비에서 정보 찾기
		FavoriteDto favoriteDto = new FavoriteDto();
		favoriteDto.setType('D');
		if(principal != null) {
			System.out.println("로그인 여부 확인 : " + principal.getName());
			favoriteDto = favoriteService.findFavorite(board.getDonationId(), principal.getName(), "D");
		}
		
		int heart = 0;
		if(favoriteDto != null) {
			// 특정 계정이 하트 눌렀는지 여부 확인
			heart = favoriteDto.getHeart();
			model.addAttribute("heart", heart);
		}
		model.addAttribute("heart", heart);
		
		// 좋아요 갯수 세기
		int count =  favoriteService.countHeart(board.getDonationId());
		model.addAttribute("count", count);
		
		return "donation/board";
	}
	
	
	
	// 기부하기
	/*
	@PostMapping("give")
	public String donate(int donationId, int amount, String content, Principal principal) {
		String memberId = principal.getName();
		service.donate(donationId, amount, content, memberId);
		
		return "redirect:/donation/board/" + donationId;
		
	}
	*/
	// [임시] 입력 게시판
	@GetMapping("write")
	public void wirte() {

	}
	
	@PostMapping("board/write")
	public String write(DonationBoardDto dto, 
						@RequestParam(name="hashTagLump")String hashTagLump, 
						@RequestParam(name="mainPhoto")MultipartFile mainPhoto,
						@RequestParam(name="folderName")String folderName, 
						Principal principal) {
		System.out.println("컨트롤러");
		String memberId = principal.getName();
		dto.setMemberId(memberId);
		
		service.dontaionBoardWrite(dto, mainPhoto, hashTagLump, folderName);
		return "redirect:/donation/main";
	}
	
	// 수정 게시판
	@RequestMapping("modify/{donationId}")
	public String modifyPage(@PathVariable int donationId, Model model) {
		DonationBoardDto dto =  service.getBoardByBoardId(donationId);
		
		String hashTags = "";
		for(int i = 0; i < dto.getHashTag().size(); i++) {
			hashTags += "#" + dto.getHashTag().get(i);
		}
		model.addAttribute("hashTags", hashTags);
		model.addAttribute("board", dto);
		return "donation/modify";
	}
	
	@PostMapping("modify")
	public String modifyDonationBoard(DonationBoardDto dto, 
										@RequestParam(name="hashTagLump")String hashTagLump, 
										@RequestParam(name="mainPhoto")MultipartFile mainPhoto,
										@RequestParam(name="folderName")String folderName,
										@RequestParam(name="oldMainPhoto")String oldMainPhoto) {
		
		System.out.println("제목 " + dto.getTitle());
		service.updateDonationBoard(dto, hashTagLump, mainPhoto, folderName, oldMainPhoto);
		
		return "redirect:/donation/board/" + dto.getDonationId();
	}

	

	
}
