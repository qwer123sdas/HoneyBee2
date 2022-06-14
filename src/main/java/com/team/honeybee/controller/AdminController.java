package com.team.honeybee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.honeybee.domain.DonationDto;
import com.team.honeybee.domain.FaqDto;
import com.team.honeybee.domain.MarketDto;
import com.team.honeybee.domain.MeetingDto;
import com.team.honeybee.domain.MemberDto;
import com.team.honeybee.service.AdminService;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@RequestMapping("index")
	public void index() {
		
	}
	
	@RequestMapping("member")
	public void member(Model model) {
		List<MemberDto> member = service.getMember();
		model.addAttribute("member", member);
	}
	
	@PostMapping("updateMember.do")
	public String updateMember(MemberDto member, RedirectAttributes rttr) {
		boolean success = service.updateMember(member);
		if(success) {
			rttr.addFlashAttribute("message", "회원정보 수정완료");
		} else {
			rttr.addFlashAttribute("message", "회원정보 수정실패");
		}
		return "redirect:/admin/member";
	}
	
	@PostMapping("deleteMember.do")
	public String deleteMember(String memberId, RedirectAttributes rttr) {
		boolean success = service.deleteMember(memberId);
		if(success) {
			rttr.addFlashAttribute("message", "회원정보 삭제완료");
		} else {
			rttr.addFlashAttribute("message", "회원정보 삭제실패");
		}
		return "redirect:/admin/member";
	}
	
	@RequestMapping("donation")
	public void donation(Model model) {
		List<DonationDto> donationList = service.getDonationList();
		model.addAttribute("donation", donationList);
	}
	
	@RequestMapping("meeting")
	public void meeting(Model model) {
		List<MeetingDto> meetingList = service.getMeetingList();
		model.addAttribute("meeting", meetingList);
	}
	
	@RequestMapping("market")
	public void market() {
		
	}
	
	@GetMapping("insert")
	public void insert() {
		
	}
	
	@PostMapping("insert")
	public String insertMarket(MarketDto dto, RedirectAttributes rttr) {
		boolean success = service.insertMarket(dto);
		
		return "redirect:/admin/market";
	}
	
	@RequestMapping("faq")
	public void faq(Model model) {
		List<FaqDto> faqList = service.getFaqList();
		model.addAttribute("faq", faqList);
	}
	
}
