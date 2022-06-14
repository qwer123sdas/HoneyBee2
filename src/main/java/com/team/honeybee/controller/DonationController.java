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
import com.team.honeybee.domain.FavoriteDto;
import com.team.honeybee.service.DonationService;
import com.team.honeybee.service.FavoriteService;

@Controller
@RequestMapping("donation")
public class DonationController {
	@Autowired
	DonationService service;
	@Autowired
	FavoriteService favoriteService;
	
	// 기부게시판 목록 : 메인 화면
	@RequestMapping("main")
	public void main(Model model) {
		// 목록 가져오기
		List<DonationDto> boardList = service.findOrder();
		
		// 기부금액 달성률
		//service.achievementRate();
		
		model.addAttribute("boardList", boardList);
	}
	
	// 기부 게시글 보기
	@RequestMapping("board/{donationId}")
	public String board(@PathVariable int donationId, Model model, Principal principal) {
		// 게시글 정보 가져오기
		DonationDto board = service.getBoard(donationId);
		model.addAttribute("board", board);
		model.addAttribute("principal", principal);
		
		// 좋아요 디비에서 정보 찾기
		FavoriteDto favoriteDto = new FavoriteDto();
		if(principal != null) {
			System.out.println("로그인 여부 확인 : " + principal.getName());
			favoriteDto = favoriteService.findFavorite(board.getDonationId(), principal.getName());
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
	@PostMapping("give")
	public String donate(int donationId, int amount, String content, Principal principal) {
		String memberId = principal.getName();
		service.donate(donationId, amount, content, memberId);
		
		return "redirect:/donation/board/" + donationId;
		
	}
	
	// [임시] 입력 게시판
	@GetMapping("write")
	public void wirte() {

	}
	
	@PostMapping("write/finished")
	public String write(DonationDto dto, Principal principal) {
		String memberId = principal.getName();
		dto.setMemberId(memberId);
		service.dontaionBoardWrite(dto);
		return "redirect:/donation/main";
	}

	
}
