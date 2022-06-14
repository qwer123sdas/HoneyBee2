package com.team.honeybee.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.honeybee.domain.DonationReplyDto;
import com.team.honeybee.service.DonationReplyService;

@Controller
@RequestMapping("donation/reply")
public class DonationReplyController {
	@Autowired
	DonationReplyService service;
	
	// 댓글 목록
	@PostMapping(path="list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<DonationReplyDto> list(int donationId, Principal principal){
		System.out.println(donationId);
		
		if(principal == null) {
			// 로그인 안할 때
			return service.getReplyByBoardId(donationId);
		}else {
			// 로그인 한 상태일 때
			System.out.println(principal.getName());
			return service.listReplyWithOwnByBoardId(donationId, principal.getName());
		}
	}
	
	// 댓글 추가
	@RequestMapping(path="add", produces = "text/plain;charset=UTF-8")
	public String addReply(DonationReplyDto reply, Principal principal) {
		if(principal != null) {
			String memberId = principal.getName();
			reply.setMemberId(memberId);
			service.addReply(reply);
		}
		
		
		return "redirect:/donation/board/" + reply.getDonationId();
	}
	
	
}
