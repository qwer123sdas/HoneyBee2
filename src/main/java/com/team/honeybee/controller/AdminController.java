package com.team.honeybee.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.honeybee.domain.DonationDto;
import com.team.honeybee.domain.FaqDto;
import com.team.honeybee.domain.MarketDto;
import com.team.honeybee.domain.MeetingDto;
import com.team.honeybee.domain.MemberDto;
import com.team.honeybee.domain.TalentDto;
import com.team.honeybee.service.AdminService;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@Autowired
	private JavaMailSender mailSender;
	
	// 메인페이지
	@RequestMapping("index")
	public void index(Model model) {
		int sumAmount = service.sumDonationAll();
		model.addAttribute("sum", sumAmount);
	}
	
	// 회원페이지 보기
	@RequestMapping("member")
	public void member(Model model) {
		List<MemberDto> member = service.getMember();
		model.addAttribute("member", member);
	}
	
	// 회원수정
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
	
	// 회원삭제
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
	
	// 기부게시글 전체보기
	@RequestMapping("donation")
	public void donation(Model model) {
		List<DonationDto> donationList = service.getDonationList();
		System.out.println(donationList);
		model.addAttribute("donation", donationList);
	}
	
	// 기부게시글 내용보기
	@GetMapping("getDonation")
	public void getDonation(int donationId, Model model) {
		DonationDto dto = service.getDonation(donationId);
		model.addAttribute("donation", dto);
	}
	
	// 기부게시글 등록허용
	@PostMapping("registerDonation")
	public String registerDonation(int donationId) {
		service.registerDonation(donationId);
		return "redirect:/admin/donation";
	}
	
	// 기부게시글 삭제
	@PostMapping("removeDonation")
	public String removeDonation(int donationId) {
		service.deleteDonation(donationId);
		return "redirect:/admin/donation";
	}
	
	// 재능판매게시글 전체보기
	@RequestMapping("talent")
	public void talent(Model model) {
		List<TalentDto> talentList = service.getTalentList();
		model.addAttribute("talent", talentList);
	}
	
	// 재능판매게시글 내용보기
	@RequestMapping("getTalent")
	public void getTalent(int talentId, Model model) {
		TalentDto dto = service.getTalent(talentId);
		System.out.println(dto);
		model.addAttribute("talent", dto);
	}
	
	// 재능판매게시글 등록허용
	@PostMapping("registerTalent")
	public String registerTalent(int talentId) {
		service.registerTalent(talentId);
		return "redirect:/admin/talent";
	}
	
	@PostMapping("removeTalent")
	public String removeTalent(int talentId) {
		service.deleteTalent(talentId);
		return "redirect:/admin/talent";
	}
	
	// 모임게시글 전체보기
	@RequestMapping("meeting")
	public void meeting(Model model) {
		List<MeetingDto> meetingList = service.getMeetingList();
		System.out.println(meetingList);
		model.addAttribute("meeting", meetingList);
	}
	
	// 모임게시글 내용보기
	@RequestMapping("getMeeting")
	public void getMeeting(int meetingId, Model model) {
		MeetingDto dto = service.getMeeting(meetingId);
		System.out.println(dto);
		// 게스트 목록 가져오기
		List<String> guestList = service.selectGuestInfo(meetingId);
		model.addAttribute("meeting", dto);
		model.addAttribute("guestList", guestList);
	}
	
	// 모임게시글 삭제
	@PostMapping("removeMeeting")
	public String removeMeeting(int meetingId) {
		service.deleteMeeting(meetingId);
		return "redirect:/admin/meeting";
	}
	
	// 기부마켓 전체보기
	@RequestMapping("market")
	public void market(Model model) {
		List<MarketDto> marketList = service.getMarketList();
		System.out.println(marketList);
		model.addAttribute("market", marketList);
	}
	
	// 기부마켓 등록페이지보기
	@GetMapping("insert")
	public void insert() {
		
	}
	
	// 기부마켓 등록하는 작업
	@PostMapping("insert")
	public String insertMarket(MarketDto dto, @RequestParam("file") MultipartFile[] file, RedirectAttributes rttr) {
		
		if(file != null) {
			List<String> fileList = new ArrayList<String>();
			for (MultipartFile f : file) {
				fileList.add(f.getOriginalFilename());
			}
			dto.setFileName(fileList);
		}
		
		dto.setMemberId("admin");
		dto.setProductCode(UUID.randomUUID().toString());
		boolean success = service.insertMarket(dto, file);
		
		if (success) {
			rttr.addFlashAttribute("message", "판매시작");
		} else {
			rttr.addFlashAttribute("message", "판매글 등록 실패");
		}
		
		return "redirect:/admin/market";
	}
	
	// 기부마켓 글 수정하기
	@PostMapping("updateMarket.do")
	public String updateMarket(MarketDto dto, 
			@RequestParam(name = "removeFileList", required = false) ArrayList<String> removeFileList,
			@RequestParam("addFileList") MultipartFile[] addFileList, 
			Model model, 
			RedirectAttributes rttr) {
		boolean success = service.updateMarket(dto, removeFileList, addFileList);
		
		return "redirect:/admin/market";
	}
	
	// 기부마켓 글 삭제하기
	@PostMapping("deleteMarket.do")
	public String deleteMarket(MarketDto dto, RedirectAttributes rttr) {
		boolean success = service.deleteMarket(dto.getMarketId());
		
		return "redirect:/admin/market";
	}
	
	// 기부마켓 글 내용보기
	@GetMapping("getMarket")
	public void getMarket(int marketId, Model model) {
		MarketDto dto = service.getMarketById(marketId);
		model.addAttribute("market", dto);
	}
	
	// 1대1문의 글 전체보기
	@RequestMapping("faq")
	public void faq(Model model) {
		List<FaqDto> faqList = service.getFaqList();
		System.out.println(faqList);
		model.addAttribute("faq", faqList);
	}
	
	// 1대1문의 글 내용보기
	@RequestMapping("getFaq")
	public void getFaq(int questionId, Model model) {
		FaqDto dto = service.getFaqById(questionId);
		System.out.println(dto);
		model.addAttribute("faq", dto);
	}
	
	// 1대1문의 답변완료 화면
	@GetMapping("answerFaq")
	public void answerFaq(@RequestParam("questionId") int questionId, @RequestParam("email") String email, Model model) {
		model.addAttribute("questionId", questionId);
		model.addAttribute("email", email);
	}
	
	// 1대1문의 글 답변완료
	@PostMapping("answerFaq")
	public String answerFaq(FaqDto dto) {
		String subject = dto.getTitle();
        String content = dto.getContent();
        String to = dto.getEmail();
		
		try {
            MimeMessage mail = mailSender.createMimeMessage();

            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
            
            mailHelper.setFrom("꿀비 <honeybee137@naver.com>");
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content);
            
            mailSender.send(mail);
            boolean success = service.modifyFaqEnableById(dto.getQuestionId());
            
        } catch(Exception e) {
            e.printStackTrace();
            return "redirect:/admin/index";
        }
		return "redirect:/admin/faq";
	}
	
	// 1대1문의 글 삭제
	@PostMapping("removeFaq")
	public String removeFaq(int questionId) {
		boolean success = service.deleteFaq(questionId);
		return "redirect:/admin/faq";
	}
}
