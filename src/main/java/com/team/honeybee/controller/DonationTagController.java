package com.team.honeybee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.honeybee.domain.DonationDto;
import com.team.honeybee.service.DonationTagService;

@Controller
public class DonationTagController {
	@Autowired
	DonationTagService service;
	
	//해쉬 태그 별, 게시글 가져오기
	@RequestMapping("donation/tags/{hashTag}")
	public String selectDonationBoardByhashTag(@PathVariable String hashTag, Model model) {
		List<DonationDto> boardList = service.getDonationBoardByhashTag(hashTag);
		model.addAttribute("boardList", boardList);
		model.addAttribute("hashTag", hashTag);
		return "donation/tags";
	}
}
