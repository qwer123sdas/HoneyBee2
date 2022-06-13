package com.team.honeybee.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.team.honeybee.domain.MeetingReplyDto;
import com.team.honeybee.service.MeetingReplyService;

@Controller
public class MeetingReplyController {
	
	@Autowired
	private MeetingReplyService service;
	
	// 로그인 회원 댓글 작성
	@PostMapping(path = "insert",  produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> insert(MeetingReplyDto reply, Principal principal) {
		
		if (principal == null) { 
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		} else {
			// 로그인 회원 아이디 얻어오기
			reply.setMember_id(principal.getName());
			
			/* 위 한줄 풀어쓰기
			 String memberId = principal.getName();
			 dto.setMemberId(memberId);
			 */
			
			boolean success = service.insertReply(reply);
			
			if (success) {
				return ResponseEntity.ok("새 댓글이 등록되었습니다.");
			} else { 
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("error");
			}
			
		}
		

		
	}
}
