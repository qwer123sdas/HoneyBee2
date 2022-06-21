package com.team.honeybee.controller;

import java.security.*;
import java.util.*;

import javax.mail.internet.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.mail.*;
import org.springframework.mail.javamail.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.mvc.support.*;

import com.team.honeybee.domain.*;
import com.team.honeybee.service.*;

@Controller
@RequestMapping("member")
public class MemberController {

	@Autowired
	private MemberService service;
	
	@Autowired
	private JavaMailSender mailSender;

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
	public String initpwProcess(String memberId, RedirectAttributes rttr) {
		String email = service.getEmailById(memberId);
		
		if(email == null || email == "") {
			return "";
		} else {
			// 메일 보내고
			Random rd = new Random();
			int number = rd.nextInt(999999);
			rttr.addFlashAttribute("OTP", String.format("%06d", number));
			rttr.addFlashAttribute("memberId", memberId);
	        String subject = "비밀번호 재설정";
	        String content = "OTP: " + String.format("%06d", number);
	        String from = "honeybee137@naver.com";
	        String to = email;
	        
	        try {
	            MimeMessage mail = mailSender.createMimeMessage();

	            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
	            
	            mailHelper.setFrom("꿀비 <honeybee137@naver.com>");
	            mailHelper.setTo(to);
	            mailHelper.setSubject(subject);
	            mailHelper.setText(content);
	            
	            mailSender.send(mail);
	            
	        } catch(Exception e) {
	            e.printStackTrace();
	            return "";
	        }
			
			// 메일 보내는거 성공하면
			// 번호6자리 넣는 화면으로 리다이렉트
			
	        return "redirect:/member/changePw";
		}
		
	}
	
	// 회원 비밀번호 변경
	@GetMapping("updatePw")
	public void changePwForm() {
		
	}
	
	@PostMapping("updatePw")
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
	
	@GetMapping("changePw")
	public void chanePw() {
		
	}
	
	// 6자리 OTP 이메일로 건내주기

}











