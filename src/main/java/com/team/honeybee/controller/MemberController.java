package com.team.honeybee.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.*;

import com.team.honeybee.domain.*;
import com.team.honeybee.service.*;

@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("signup")
	public void signupForm() {
		
	}
	
	@GetMapping("login")
	public void signinPage() {
		
	}
	
	@RequestMapping("temp-mainPage") 
	public void index() {
		
	}
	
	// 메인 페이지 경로 생기면 임시 메인페이지 빼고 기입할 것
	@PostMapping("signup")
	public String signupProcess(MemberDto member, RedirectAttributes rttr) { 
		boolean success = service.addMember(member);
		
		if(success) {
			
			rttr.addFlashAttribute("message", "회원가입이 완료되었습니다.");
			return "redirect:/member/temp-mainPage";
			
		} else {
			
			rttr.addFlashAttribute("message", "회원가입에 실패하였습니다.");
			rttr.addFlashAttribute("member", member);
			return "redirect:/member/signup";
			
		}
	}
	
	@GetMapping(path = "check", params = "memberId")
	@ResponseBody
	public String idCheck(String memberId) {
		boolean exist = service.hasMemberId(memberId);
		
		if(exist) {
			return "bad";
		} else {
			return "good";
		}
	}
	
	@GetMapping(path = "check", params = "email")
	@ResponseBody
	public String emailCheck(String email) {
		boolean exist = service.hasMemberEmail(email);
		
		if(exist) {
			return "bad";
		} else {
			return "good";
		}
	}
	
	@GetMapping(path = "check", params = "nickname")
	@ResponseBody
	public String nickNameCheck(String nickname) {
		boolean exist = service.hasMemberNickName(nickname);
		
		if(exist) {
			return "bad";
		} else {
			return "good";
		}
	}
	@GetMapping("findId")
	public void findIdPage() {
		
	}
	
	@GetMapping("findIdView")
	public void findIdView() {
		
	}
	
	@PostMapping("findId")
	public String findId(String name, String email, Model model) {
		int exist = service.findId(name, email);
		if(exist == 0) {
			model.addAttribute("message", "회원이 아님.");
			return "/member/findIdView";
		}else {
			String memberId = service.findId2(name, email);
			model.addAttribute("message", memberId);
			return "/member/findIdView";
		}
	}
}



















