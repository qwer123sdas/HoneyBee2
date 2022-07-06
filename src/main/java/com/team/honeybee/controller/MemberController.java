package com.team.honeybee.controller;

import java.security.*;
import java.util.*;

import javax.mail.internet.*;
import javax.servlet.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.mail.javamail.*;
import org.springframework.security.core.*;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.mvc.support.*;

import com.team.honeybee.domain.*;
import com.team.honeybee.service.*;

@Controller
@RequestMapping("member")
public class MemberController {

	@Autowired
	private TalentBoardService talentBoardService;
	
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

	@RequestMapping("main")
	public void mainHomePage() {

	}

	// 메인 페이지 경로 생기면 임시 메인페이지 빼고 기입할 것
	@PostMapping("signup")
	public String signupProcess(MemberDto member, RedirectAttributes rttr) {
		boolean success = service.addMember(member);

		if (success) {

			rttr.addFlashAttribute("message", "회원가입이 완료되었습니다.");
			return "redirect:/main";

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

		if (success) {
			rttr.addFlashAttribute("message", "회원 탈퇴를 완료하였습니다.");
			return "redirect:/logout";
		} else {
			rttr.addFlashAttribute("memberId", dto.getMemberId());
			return "redirect:/member/info";
		}
	}

	// 회원 정보 수정
	@PostMapping("modify")
	public String modifyMember(MemberDto dto, String oldPw, @RequestParam("profileFile") MultipartFile profile,
			RedirectAttributes rttr) {
		if (profile.getSize() > 0) {
			dto.setProfile(profile.getOriginalFilename());
		}

		boolean success = service.modifyMember(dto, oldPw, profile);
		if (success) {
			rttr.addFlashAttribute("message", "회원 정보가 수정되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "회원 정보가 수정되지 않았습니다.");
		}
		rttr.addAttribute("memberId", dto.getMemberId());
		return "redirect:/member/info";
	}

	// 이메일을 이용한 비밀번호 찾기
	@GetMapping("initpw")
	public void initpwPage() {

	}

	@PostMapping("initpw")
	public String initpwProcess(String memberId, HttpSession session, RedirectAttributes rttr) {
		String email = service.getEmailById(memberId);

		if (email == null || email == "") {
			return "";
		} else {
			// 메일 보내기
			Random rd = new Random();
			int number = rd.nextInt(999999);
			rttr.addFlashAttribute("OTP", String.format("%06d", number));
			rttr.addFlashAttribute("memberId", memberId);
			String subject = "요청하신 인증번호를 발송해드립니다.";
			String content = "인증번호를 인증번호 입력창에 입력해 주세요." + "OTP: " + String.format("%06d", number);
			String from = "honeybee137@naver.com";
			String to = email;

			session.setAttribute("OTPVALUE", String.format("%06d", number));

			try {
				MimeMessage mail = mailSender.createMimeMessage();

				MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");

				mailHelper.setFrom("꿀비 <honeybee137@naver.com>");
				mailHelper.setTo(to);
				mailHelper.setSubject(subject);
				mailHelper.setText(content);

				mailSender.send(mail);

			} catch (Exception e) {
				e.printStackTrace();
				return "redirect:/member/login";
			}

			// 메일 보내는거 성공하면
			// 번호6자리 넣는 화면으로 리다이렉트
			return "redirect:/member/changePw";
		}

	}

	// OTP 비밀번호 설정
	@GetMapping("changePw")
	public void checkOtpForm() {

	}

	@PostMapping("changePw")
	public String checkOtpProcess(@RequestParam("newPw") String newPw,
			@RequestParam("newPwConfirm") String newPwConfirm, String memberId, RedirectAttributes rttr) {
		//		System.out.println(session.getAttribute("OTPVALUE"));
		//		System.out.println(otpValue);
		//		System.out.println(newPw);
		//		System.out.println(newPwConfirm);
		if (newPw != null && !newPw.equals("") && newPw.equals(newPwConfirm)) {
			service.changePw(memberId, newPw);
			rttr.addFlashAttribute("message", "비밀번호가 변경되었습니다.");
			return "redirect:/member/login";
		} else {
			rttr.addFlashAttribute("message", "비밀번호 변경에 실패하였습니다. 다시 시도해주세요.");
			return "redirect:/member/initpw";
		}
	}

	// 마이페이지 회원 비밀번호 변경
	@GetMapping("updatePw")
	public void changePwForm() {

	}

	@PostMapping("updatePw")
	public String changePwProcess(String pw, String newPw, Principal principal, RedirectAttributes rttr,
			HttpServletRequest req) throws ServletException {
		String memberId = principal.getName();
		boolean success = service.updatePw(memberId, pw, newPw);

		if (success) {
			rttr.addFlashAttribute("message", "비밀번호가 변경되었습니다.");
			req.logout();
			return "redirect:/member/login";
		} else {
			rttr.addFlashAttribute("message", "비밀번호 변경에 실패하였습니다.");
			return "redirect:/main";
		}
	}

	@RequestMapping("about")
	public void aboutForm() {

	}

	// 마이페이지 상담내역
	@RequestMapping("faqList")
	public void faqList(Model model, Principal principal) {
		List<FaqDto> list = service.faqList(principal.getName());
		System.out.println(list);
		model.addAttribute("faqList", list);
	}

	//마이페이지 상담 내용 불러오기
	@GetMapping("faqGet")
	public void faqGet(int questionId, Model model) {
		FaqDto faq = service.getFaqById(questionId);
		model.addAttribute("faq", faq);
	}

	//마이 페이지 삭제
	@PostMapping("removeFaq")
	public String removeFaq(@RequestParam("questionIdList") List<Integer> questionIdList, RedirectAttributes rttr) {
		boolean success = false;
		for (int questionId : questionIdList) {
			success = service.removefaqId(questionId);
		}
		if (success) {
			rttr.addFlashAttribute("message", "글이 삭제 되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "글이 삭제 되지않았습니다.");
		}
		return "redirect:/member/faqList";
	}

	// 내가 쓴 게시글 모음
	@RequestMapping("myBoard")
	public void myBoard(Principal principal, Model model) {
		List<DonationBoardDto> donation = service.getDonationByMemberId(principal.getName());
		List<TalentBoardDto> talent = service.getTalentByMemberId(principal.getName());
		List<MeetingDto> meeting = service.getMeetingByMemberId(principal.getName());
		model.addAttribute("donation", donation);
		model.addAttribute("talent", talent);
		model.addAttribute("meeting", meeting);
	}

	// 내가 쓴 댓글 모음
	@RequestMapping("myReview")
	public void myReview(Principal principal, Model model) {
		List<DonationReplyDto> donationReply = service.getDonationReplyByMemberId(principal.getName());
		List<MeetingCommentDto> meetingComment = service.getMeetingCommentByMemberId(principal.getName());
		model.addAttribute("donationReply", donationReply);
		model.addAttribute("meetingComment", meetingComment);
	}
	
	@PostMapping("deleteDonationReply")
	public String deleteDonationReply(String replyId) {
		System.out.println(replyId);
		boolean success = service.deleteDonationReplyByReplyId(replyId);
		System.out.println(success);
		return "redirect:/member/myReview";
	}
	
	@PostMapping("deleteMeetingComment")
	public String deleteMeetingComment(String meetingCommentId) {
		System.out.println(meetingCommentId);
		boolean success = service.deleteMeetingCommentByMeetingCommentId(meetingCommentId);
		System.out.println(success);
		return "redirect:/member/myReview";
	}
	
	// 유저/어드민 로그인 따로
	@GetMapping("loginSuccess")
	public String loginSuccess(Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		System.out.println("User has authorities: " + userDetails.getAuthorities());
		Collection<? extends GrantedAuthority> authorities = userDetails.getAuthorities();
		
		for (GrantedAuthority auth : authorities) {
			if (auth.getAuthority().equals("ROLE_ADMIN")) {
				return "redirect:/admin/index";
			}
		}

		return "redirect:/main";
	}
	// 마이페이지에 주문내역 불러오기
		@GetMapping("payList")
		public void payList(Model model, Principal principal) {
			List<OrderPayDto> list = service.payList(principal.getName());
			System.out.println(list);
			List<MarketDto> marketList = new ArrayList<>();
			for (OrderPayDto opd : list) {
				System.out.println(opd.getProductCode());
				MarketDto market = service.getMarket(opd.getProductCode());
				marketList.add(market);
			}
			System.out.println(marketList);
			model.addAttribute("payList", list);
			model.addAttribute("marketList", marketList);
		}

		// 마이페이지 주문 상세 내용 불러오기
		@GetMapping("payGet")
		public void payGet(int orderId, Model model) {
			OrderPayDto opd = service.payGet(orderId);
			System.out.println(opd);
			MarketDto market = service.getMarket(opd.getProductCode());
			System.out.println(market);
//				TalentDto talent = service.getTalent(opd.getProductCode());
			model.addAttribute("opd", opd);
			model.addAttribute("market", market);
//				model.addAttribute("talent", talent);
		}
		@GetMapping("talentPayList")
		public void TalentPay(Model model) {
		List<TalentBoardDto> myTalentList = talentBoardService.findBoardList("", "");
		model.addAttribute("myTalentList", myTalentList);
		
	
}
		
}