package com.team.honeybee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.honeybee.domain.MemberDto;
import com.team.honeybee.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {

	@Autowired
	private MemberService service;

	@GetMapping("index2")
	public void index2() {

	}
	
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

	@GetMapping(path = "check", params = "memberId")
	@ResponseBody
	public String idCheck(String memberId) {
		boolean exist = service.hasMemberId(memberId);

		if (exist) {
			return "bad";
		} else {
			return "good";
		}
	}

	@GetMapping(path = "check", params = "email")
	@ResponseBody
	public String emailCheck(String email) {
		boolean exist = service.hasMemberEmail(email);

		if (exist) {
			return "bad";
		} else {
			return "good";
		}
	}

	@GetMapping(path = "check", params = "nickname")
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
	public void info(String memberId, String name, String email, String nickname, String postcode, String address, String detail, String phone, Model model) {
		MemberDto info = service.memberInfo(memberId, name, email, nickname, postcode, address, detail, phone);
		model.addAttribute("memberInfo", info);
	}
}
