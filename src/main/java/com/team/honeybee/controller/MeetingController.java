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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.honeybee.domain.MeetingDto;
import com.team.honeybee.domain.MeetingGuestDto;
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
		
		// 댓글 리스트
		List<MeetingReplyDto> replyList = replyService.getReplyByMeetingId(meetingId);
		
		// 게스트 목록 가져오기
		List<String> guest = service.selectGuestInfo(meetingId);

		
		model.addAttribute("meeting", board);
		model.addAttribute("replyList", replyList);
		model.addAttribute("meetingGuest", guest);
		
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
	
	// meetingBoard, guest 입력받기
	@Transactional
	@PostMapping("board/addGuest")
	public String meeintGuestInfo(MeetingDto meeting, 
									@RequestParam(value="meetingId", defaultValue = "0") int meetingId, 
									Principal principal) {
		
		// 로그인 회원 아이디값 넣기
		String memberId = principal.getName();
		meeting.setMemberId(memberId);
		
		// 현재 인원수 가져오기
		int cntNum = 0;
		cntNum = service.meetingSelectGuest(meeting, meetingId);
		System.out.println("================");
		System.out.println(cntNum);
		
		System.out.println("셀렉 값 가져옴");
		System.out.println(meetingId);
		System.out.println(meeting.getMemberId());
	
		
		// 모임 게스트 입력
		service.meetingInsertGuest(meeting, meeting.getMemberId(), meetingId);	
		
		System.out.println("인서트 값 입력");
		System.out.println(meetingId);
		System.out.println(meeting.getMemberId());
		
		return "redirect:/meeting/board/" + meeting.getMeetingId();

	}
	
	@GetMapping("login")
	public void login() {
		
	}
	
	
	
	
	
}
