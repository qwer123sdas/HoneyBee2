package com.team.honeybee.controller;


import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.honeybee.domain.MeetingReplyDto;
import com.team.honeybee.service.MeetingReplyService;

@Controller
@RequestMapping("meeting/reply")
public class MeetingReplyController {

	@Autowired
	private MeetingReplyService replyService;

	
	// 댓글 목록 가져오기
	@GetMapping("list")
	@ResponseBody
	public List<MeetingReplyDto> replyList(int meetingId, Principal principal) {
		
		List<MeetingReplyDto> listReplyByMeetingId = replyService.listReplyByMeetingId(meetingId);

		for (MeetingReplyDto item : listReplyByMeetingId) {
			if (principal != null && principal.getName().equals(item.getMemberId())) {
				item.setOwn(true);
			}
			System.out.println(item);
		}
		/*
		// 댓글별 좋아요 갯수 가져오기
		MeetingReplyDto reply = new MeetingReplyDto();
		int favoriteCount = favoriteService.getFavoriteCountByMeetingReplyId(meetingId, reply.getMeetingReplyId());
		reply.setFavoriteCount(favoriteCount);
		*/
		
		
		return listReplyByMeetingId;
	}

	// 로그인 회원 부모댓글 작성
	@PostMapping(path = "insertReplyP", produces = "text/plain;charset=UTF-8")
	public String insertMeetingReply(MeetingReplyDto reply, Principal principal) {
		
		if (principal != null) {
			String memberId = principal.getName();
			reply.setMemberId(memberId);
			replyService.insertMeetingReply(reply);
		} else {
			return "redirect:/member/login";
		}
		
		return "redirect:/meeting/board/" + reply.getMeetingId();
	}
	
	
	// 로그인 회원 자식댓글 작성
	@PostMapping(path = "insertReplyC", produces = "text/plain;charset=UTF-8")
	public String insertMeetingReplyChild(MeetingReplyDto reply, Principal principal) {
		
		if (principal != null) {
			String memberId = principal.getName();
			reply.setMemberId(memberId);
			replyService.insertMeetingReplyChild(reply);
		} else {
			return "redirect:/member/login";
		}
		
		return "redirect:/meeting/board/" + reply.getMeetingId();
	}
	
	// 로그인 회원 댓글 수정
	@PostMapping(path = "updateReply", produces = "text/plain;charset=UTF-8")
	public String updateMeetingReply(MeetingReplyDto reply, Principal principal) {
		// 댓글 작성자만 수정 가능하도록
		replyService.updateMeetingReply(reply); 
		
		return "redirect:/meeting/board/" + reply.getMeetingId();
	}
	

	// 로그인 회원 댓글 삭제(댓글 삭제시 DB에 deleteInfo update됨)
	@PostMapping(path = "deleteReply", produces = "text/plain;charset=UTF-8")
	public String deleteMeetingReply(MeetingReplyDto reply,
										@RequestParam("meetingReplyId") int meetingReplyId,
										Principal principal) {
		
		System.out.println("요기확인" + meetingReplyId);
		String memberId = principal.getName();
		System.out.println("요기확인" + memberId);
		replyService.deleteMeetingReply(meetingReplyId, memberId);
		
		return "redirect:/meeting/board/" + reply.getMeetingId();
	}



}
