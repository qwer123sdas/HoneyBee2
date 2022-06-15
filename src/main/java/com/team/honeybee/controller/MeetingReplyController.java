package com.team.honeybee.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team.honeybee.domain.MeetingReplyDto;
import com.team.honeybee.service.MeetingReplyService;

@RestController
@RequestMapping("meeting/reply")
public class MeetingReplyController {

	@Autowired
	private MeetingReplyService service;
	
	// 댓글 목록 가져오기
	@PostMapping("list")
	public List<MeetingReplyDto> list(int meetingId, Principal principal) {
		
		if (principal == null) { // 로그인 안한사람은 보드만 
			return service.getReplyByMeetingId(meetingId);
		} else { // 로그인한 사람이면 로그인 정보 넘겨줌
			return service.getReplyWithOwnMeetingId(meetingId, principal.getName());
		}
	}

	// 로그인 회원 댓글 작성
	@PostMapping(path = "insert", produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> insert(MeetingReplyDto reply, Principal principal) {

		if (principal == null) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		} else {
			// 로그인 회원 아이디 얻어오기
			reply.setMemberId(principal.getName());

			boolean success = service.insertMeetingReply(reply);

			if (success) {
				return ResponseEntity.ok("새 댓글이 등록되었습니다.");
			} else {
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("error");
			}
		}

	}
}
