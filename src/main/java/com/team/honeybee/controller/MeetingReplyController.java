package com.team.honeybee.controller;


import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.honeybee.domain.MeetingReplyDto;
import com.team.honeybee.service.MeetingReplyService;

@Controller
@RequestMapping("meeting/reply")
public class MeetingReplyController {

	@Autowired
	private MeetingReplyService service;
	
	// 댓글 목록 가져오기
	@GetMapping("list")
	@ResponseBody
	public List<MeetingReplyDto> replyList(int meetingId) {
		
		List<MeetingReplyDto> listReplyByMeetingId = service.listReplyByMeetingId(meetingId);
		
		for (MeetingReplyDto item : listReplyByMeetingId) {
			System.out.println(item);
		}
		
		return listReplyByMeetingId;
	}
	
	/*
	// 댓글 목록 가져오기
	@GetMapping("list")
	@ResponseBody
	public List<MeetingReplyDto> replyList1(int meetingId, Principal principal) {
		
		if (principal == null) { // 로그인 안한사람은 보드만 
			return service.getReplyByMeetingId(meetingId);
		} else { // 로그인한 사람이면 로그인 정보 넘겨줌
			return service.getReplyWithOwnMeetingId(meetingId, principal.getName());
		}
	
		
	}
	*/
	
	// 로그인 회원 부모댓글 작성
	@PostMapping(path = "insertReplyP", produces = "text/plain;charset=UTF-8")
	public String insertMeetingReply(MeetingReplyDto reply, Principal principal) {
		
		if (principal != null) {
			String memberId = principal.getName();
			reply.setMemberId(memberId);
			service.insertMeetingReply(reply);
		}
		
		return "redirect:/meeting/board/" + reply.getMeetingId();
	}
	
	
	// 로그인 회원 자식댓글 작성
	@PostMapping(path = "insertReplyC", produces = "text/plain;charset=UTF-8")
	public String insertMeetingReplyChild(MeetingReplyDto reply, Principal principal) {
		
		if (principal != null) {
			String memberId = principal.getName();
			reply.setMemberId(memberId);
			service.insertMeetingReplyChild(reply);
		}
		System.out.println(reply);
		return "redirect:/meeting/board/" + reply.getMeetingId();
	}
	
	// 로그인 회원 댓글 수정
	@PostMapping(path = "updateReply", produces = "text/plain;charset=UTF-8")
	public String updateMeetingReply(MeetingReplyDto reply, Principal principal) {
		service.updateMeetingReply(reply);
		return "redirect:/meeting/board/" + reply.getMeetingId();
	}
	

	// 로그인 회원 댓글 삭제(댓글 삭제시 DB에 deleteInfo update됨)
	@PostMapping(path = "deleteReply", produces = "text/plain;charset=UTF-8")
	public String deleteMeetingReply(MeetingReplyDto reply, Principal principal) {
		reply.setDeleteInfo("Y");
		service.deleteMeetingReply(reply);
		
		return "redirect:/meeting/board/" + reply.getMeetingId();
	}
	
	@GetMapping("replyform")
	public void replyform () {
		
	}


}
