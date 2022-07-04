package com.team.honeybee.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.honeybee.domain.MeetingCommentDto;
import com.team.honeybee.domain.MeetingDto;
import com.team.honeybee.domain.MeetingGuestDto;
import com.team.honeybee.domain.MeetingReplyDto;
import com.team.honeybee.service.MeetingGuestService;
import com.team.honeybee.service.MeetingReplyService;
import com.team.honeybee.service.MeetingService;


@Controller
@RequestMapping("meeting")
public class MeetingController {
	
	@Autowired
	private MeetingService service;
	
	@Autowired
	private MeetingReplyService replyService;
	
	@Autowired 
	private MeetingGuestService guestService;
	 
	@PostMapping("insert")
	public String meetingInsertProcess(MeetingDto meeting, 
										MeetingGuestDto guest,
										@RequestParam("guestNum") int guestNum,
										@RequestParam("mainPhoto") MultipartFile mainPhoto, 
										@RequestParam("hashTagRaw") String hashTagRaw,
										@RequestParam(name="folderName")String folderName, 
										Principal principal, 
										RedirectAttributes rttr) {
		
		// 로그인 회원 아이디값 넣기
		String memberId = principal.getName();
		meeting.setMemberId(memberId);
		// 게스트 인원 넣기
		guest.setGuestNum(guestNum);

		boolean success = service.insertBoard(meeting, mainPhoto, hashTagRaw, folderName); 
		
		if (success) {
			rttr.addFlashAttribute("message", "새 글이 등록되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "새 글이 등록되지 않았습니다.");
		}
		
		return "redirect:/meeting/insert";
	}
	
	// 기부모임 메인(topic추가함)
	@RequestMapping("main")
	public void meetingMain(@RequestParam(name="sort", defaultValue = "") String sort, 
							@RequestParam(name="topic_id", defaultValue = "") String topic, Model model) {
		
		// 모임 리스트 
		List<MeetingDto> list = service.meetingList(sort, topic);
		System.out.println(list);
		
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
		
		// 게스트 목록 가져오기
		List<String> guestList = guestService.selectGuestInfo(meetingId);
		
		// 댓글 리스트
		List<MeetingReplyDto> replyList = replyService.getReplyByMeetingId(meetingId);
		

		model.addAttribute("meeting", board); // 게시물
		// 댓글 목록
		model.addAttribute("replyList", replyList); 
		
		// 게스트 ajax처리
		// model.addAttribute("meetingGuest", guest);
		
		return "/meeting/board";
	}
	
	// 후기입력 모달
	@PostMapping("commentAdd")
	public String meetingCommentAdd(Principal principal, @RequestParam("content") String content) {
		if (principal != null) {
			String memberId = principal.getName();
			
			service.meetingCommentAdd(memberId, content);
		}
		
		return "redirect:/meeting/main";
	}
	
	// 게시판 수정전 기존 게시물 선택, 기존 해시태그
	@RequestMapping("modify/{meetingId}")
	public String getMeetingBoardModify(@PathVariable int meetingId, Model model) {
		
		MeetingDto board = service.getBoardByMeetingId(meetingId);
		
		String hashTags = "";
		for(int i = 0; i < board.getHashTag().size(); i++) {
			hashTags += "#" + board.getHashTag().get(i);
		}
		
		model.addAttribute("hashTags", hashTags);
		model.addAttribute("meeting", board);
		
		return "meeting/modify";
		
	}
	
	// 게시판 수정
	@PostMapping("modify1")
	public String updateByMeetingBoard(MeetingDto meeting, 
										@RequestParam(name="hashTagRaw")String hashTagRaw, 
										@RequestParam(name="mainPhoto")MultipartFile mainPhoto,
										@RequestParam(name="folderName")String folderName,
										@RequestParam(name="oldMainPhoto")String oldMainPhoto) {
		
		
		service.updateByMeetingBoard(meeting, hashTagRaw, mainPhoto, folderName, oldMainPhoto);
		
		return "redirect:/meeting/board/" + meeting.getMeetingId();
	}
	
	// 입력위해 만듬 나중에 제안하기로 이동함
	@GetMapping("insert")
	public void meetingInsert() {
		
	}
	
	@GetMapping("login")
	public void login() {
		
	}
	
	@GetMapping("modify")
	public void modify() {
		
	}
	
	
	
	
	
}
