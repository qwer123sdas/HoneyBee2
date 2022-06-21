package com.team.honeybee.controller;

import java.security.*;

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

		if (success) {

			rttr.addFlashAttribute("message", "회원가입이 완료되었습니다.");
			return "redirect:/member/temp-mainPage";

		} else {

			rttr.addFlashAttribute("message", "회원가입에 실패하였습니다.");
			rttr.addFlashAttribute("member", member);
			return "redirect:/member/signup";

		}
	}

	@PostMapping("memberId/check")
	@ResponseBody
	public String idCheck(String memberId) {
		boolean exist = service.hasMemberId(memberId);

		if (exist) {
			return "bad";
		} else {
			return "good";
		}
	}

	@PostMapping("email/check")
	@ResponseBody
	public String emailCheck(String email) {
		boolean exist = service.hasMemberEmail(email);

		if (exist) {
			return "bad";
		} else {
			return "good";
		}
	}

	@PostMapping("nickname/check")
	@ResponseBody
	public String nickNameCheck(String nickname) {
		boolean exist = service.hasMemberNickName(nickname);

		if (exist) {
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

	// 아이디 찾기
	@PostMapping("findId")
	public String findId(String name, String email, Model model) {
		int exist = service.findId(name, email);
		if (exist == 0) {
			model.addAttribute("message", "등록된 회원이 아니거나 잘못 입력하였습니다.");
			return "/member/findIdView";
		} else {
			String memberId = service.findId2(name, email);
			model.addAttribute("message", memberId);
			return "/member/findIdView";
		}
	}
	
	// 회원 정보
	@GetMapping("info")
	public void infoPage(String memberId, Model model) {
		MemberDto info = service.memberInfo(memberId);
		model.addAttribute("memberInfo", info);
	}
	@PostMapping("info")
	public void info() {

	}
	
	// 회원 탈퇴 
	
	@PostMapping("remove")
	public String removeMember(MemberDto dto, RedirectAttributes rttr) {
		boolean success = service.removeMember(dto);
		
		if(success) {
			rttr.addFlashAttribute("message", "회원 탈퇴를 완료하였습니다.");
			return "redirect:/member/temp-mainPage";
		} else {
			rttr.addFlashAttribute("memberId", dto.getMemberId());
			return "redirect:/member/info";
		}
	}
	
	// 회원 정보 수정
	@PostMapping("modify")
	public String modifyMember(MemberDto dto, String oldPw, RedirectAttributes rttr) {
		boolean success = service.modifyMember(dto, oldPw);
		if(success) {
			rttr.addFlashAttribute("message", "회원 정보가 수정되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "회원 정보가 수정되지 않았습니다.");
		}
		rttr.addAttribute("memberId", dto.getMemberId()); 
		return "redirect:/member/info";
	}
	
	// 회원 비밀번호 초기화
	@GetMapping("initpw")
	public void initpwPage() {
		
	}
	
	@PostMapping("initpw")
	public String initpwProcess(String memberId) {
		service.initPw(memberId);
		
		return "redirect:/member/login";
	}
	
	// 회원 비밀번호 변경
	@GetMapping("changePw")
	public void changePwForm() {
		
	}
	
	@PostMapping("changePw")
	public String changePwProcess(MemberDto dto,Principal principal, RedirectAttributes rttr) {
		dto.setMemberId(principal.getName());
		boolean success = service.changePw(dto);
		
		if(success) {
			rttr.addFlashAttribute("message", "비밀번호가 변경되었습니다.");
			return "redirect:/member/login";
		} else {
			rttr.addFlashAttribute("message", "비밀번호 변경에 실패하였습니다.");
			rttr.addFlashAttribute("dto", dto);
			return "redirect:/member/temp-mainPage";
		}
	}
}











