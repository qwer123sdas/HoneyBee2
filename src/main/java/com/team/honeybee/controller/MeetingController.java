package com.team.honeybee.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
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

		
		model.addAttribute("meeting", board); // 게시물
		model.addAttribute("replyList", replyList); // 댓글 목록
		model.addAttribute("meetingGuest", guest); // 게스트 목록
		
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
			rttr.addFlashAttribute("message", "새 글이 등록되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "새 글이 등록되지 않았습니다.");
		}
		
		return "redirect:/meeting/insert";
	}
	
	// 꿀비 모임 정해진 인원수 만큼 게스트 등록받기
	@Transactional
	@PostMapping("board/addGuest")
	public String meeintGuestInfo(MeetingDto meeting, 
								  @RequestParam(value="meetingId", defaultValue = "0") int meetingId, 
								  Principal principal,
								  RedirectAttributes rttr) {
		
		// 로그인 회원 아이디값 넣기
		String memberId = principal.getName();
		meeting.setMemberId(memberId);
		System.out.println("로그인 회원"+memberId);
		
		// 현재 인원수 가져오기
		int cntNum = service.meetingSelectGuest(meeting, meetingId);
		System.out.println("현재 인원수"+cntNum);
		
		// 등록전 존재여부 확인을 가져옴
		String yn = service.guestSelectOverlap(memberId, meetingId);
		System.out.println("중복확인용"+yn);
		
		// 이미 신청한 사람, 중복 신청 방지 
		if("Y".equals(yn)) {
			// 중복 신청 메세지 출력
			System.out.println("중복확인용" + yn);
			rttr.addFlashAttribute("message", "이미 신청하셨습니다! 모임날 만나요~");
		} 
		System.out.println("중복확인용"+yn);
		//등록 가능 & 입력한 ID가 없음
		// 모임 게스트 입력
		if("N".equals(yn)) {
			service.meetingInsertGuest(memberId, meetingId);
			rttr.addFlashAttribute("message", "꿀비 모임이 신청되었습니다!");
			System.out.println("NO=== "+ yn);
		}
		
		// 모임인원이 종료된 경우 메세지 출력 
		if(cntNum > meeting.getGuestNum()) {
			rttr.addFlashAttribute("message", "꿀비들이 다 모였습니다. 다른 모임을 신청해주세요");
		}
		System.out.println("종료됨");
		
		return "redirect:/meeting/board/" + meeting.getMeetingId();

	}
	

	// 모임 신청 완료자 취소
	@PostMapping("board/deleteGuest")
	public String deleteGuest(MeetingDto meeting,
			@RequestParam(value="meetingId", defaultValue = "0") int meetingId, 
									  Principal principal,
									  RedirectAttributes rttr) {
		System.out.println("11111111");
		// 게시물 정보 얻기
		MeetingDto meetingBoard = service.getBoardByMeetingId(meeting.getMeetingId());
		
		System.out.println("2222");
		
		// 로그인 회원 아이디값 넣기
		// 널일때 로그인 페이지(나중에 )
		// StringUtils.isEmpty(str) 메소드 사용하기 : 널일때 로그인 페이지(나중에 )
		String memberId = principal.getName();
		//meeting.setMemberId(memberId);
		
		int success = service.meeintGuestDelete(memberId, meetingBoard.getMeetingId());
		
		if(success > 0) {
			rttr.addFlashAttribute("message", "취소가 완료되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "취소되지 않았습니다. 관리자에게 문의해주세요.");
		}
		
		return "redirect:/meeting/board/" + meeting.getMeetingId();
	}
	
	
	
	
	@GetMapping("login")
	public void login() {
		
	}
	
	
	
	
	
}
