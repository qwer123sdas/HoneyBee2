package com.team.honeybee.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.honeybee.domain.DonationBoardDto;
import com.team.honeybee.domain.MeetingDto;
import com.team.honeybee.domain.TalentBoardDto;
import com.team.honeybee.service.*;

@Controller
public class HomeController {
	@Autowired
	DonationBoardService donationService;
	
	@Autowired
	AdminService service;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	TalentBoardService talentService;
	
	@Autowired
	MeetingService meetingService;
	
	@RequestMapping("/")
	public String index() {
		return "redirect:/main";
	}
	
	@RequestMapping(value = "main")
	public void home(Model model) {
		int sumAmount = service.sumDonationAll();
		int count = memberService.countMember();
		model.addAttribute("sum", sumAmount);
		model.addAttribute("count", count);
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
		}else if(type.equals("talent")){
			List<TalentBoardDto> boardList = talentService.selectTalentBoardBySearch("%" + keyword + "%");
			model.addAttribute("boardList", boardList);
			System.out.println(boardList);
		}else{
			List<MeetingDto> boardList = meetingService.selectMeetingBoardBySearch("%" + keyword + "%");
			model.addAttribute("boardList", boardList);
		}
		
		
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
	}
}
