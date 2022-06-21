package com.team.honeybee.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.honeybee.domain.MeetingDto;
import com.team.honeybee.domain.MeetingReplyDto;
import com.team.honeybee.service.MeetingReplyService;
import com.team.honeybee.service.MeetingService;

@Controller
@RequestMapping("meeting")
public class MeetingController {
	
	@Autowired
	private MeetingService service;
	
	@Autowired
	private MeetingReplyService replyService;
	
	// 기부모임 메인(topic추가함)
	@RequestMapping("main")
	public void meetingMain(@RequestParam(name="sort", defaultValue = "") String sort, 
							@RequestParam(name="topic_id", defaultValue = "") String topic, Model model) {
		
		// 모임 리스트 
		List<MeetingDto> list = service.meetingList(sort, topic);
		
		model.addAttribute("meetingList", list);
		// sort, topic 추가
		model.addAttribute("sort", sort);
		model.addAttribute("topic", topic);
		
	}
	
	// 기부모임 게시물 보기
	@RequestMapping("board/{meetingId}")
	public String getMeetingBoard(@PathVariable int meetingId, Model model) {
		// 게시물 정보 가져옴
		MeetingDto board = service.getBoardByMeetingId(meetingId);
		
		List<MeetingReplyDto> replyList = replyService.getReplyByMeetingId(meetingId);
		model.addAttribute("meeting", board);
		model.addAttribute("replyList", replyList);
		
		return "/meeting/board";
	}
	
	// 입력위해 만듬 나중에 제안하기로 이동함
	@GetMapping("insert")
	public void meetingInsert() {
		
	}
	
	
	@PostMapping("insert")
	public String meetingInsertProcess(MeetingDto meeting, 
						@RequestParam("mainPhoto") MultipartFile mainPhoto, 
						@RequestParam("hashTagRaw") String hashTagRaw,
						Principal principal, 
						RedirectAttributes rttr) {
		
		// 로그인 회원 아이디값 넣기
		String memberId = principal.getName();
		meeting.setMemberId(memberId);

		boolean success = service.insertBoard(meeting, mainPhoto, hashTagRaw); 
		
		if (success) {
			rttr.addAttribute("message", "새 글이 등록되었습니다.");
		} else {
			rttr.addAttribute("message", "새 글이 등록되지 않았습니다.");
		}
		
		return "redirect:/meeting/insert";
	}
	
	@GetMapping("login")
	public void login() {
		
	}
	
	
	
	
	
}
