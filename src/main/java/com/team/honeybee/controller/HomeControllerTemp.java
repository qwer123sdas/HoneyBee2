package com.team.honeybee.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.honeybee.domain.DonationBoardDto;
import com.team.honeybee.domain.TalentBoardDto;
import com.team.honeybee.service.DonationBoardService;
import com.team.honeybee.service.TalentBoardService;

@Controller
public class HomeControllerTemp {
	@Autowired
	DonationBoardService donationService;
	
	@Autowired
	TalentBoardService talentService;
	
	@RequestMapping(value = "main")
	public void home() {
		
	}
	@RequestMapping("search")
	public void serach(@RequestParam(name="keyword", defaultValue = "")String keyword, 
						@RequestParam(name="type", defaultValue = "donation")String type,
						Model model) {
		System.out.println(type);
		System.out.println(keyword);
		System.out.println(type == "donation");
		if(type.equals("donation")) {
			List<DonationBoardDto> boardList = donationService.selectDonationBoardBySearch("%" + keyword + "%");
			model.addAttribute("boardList", boardList);
		}else {
			List<TalentBoardDto> boardList = talentService.selectTalentBoardBySearch("%" + keyword + "%");
			model.addAttribute("boardList", boardList);
			System.out.println(boardList);
		}
		
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
	}
}
