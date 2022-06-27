package com.team.honeybee.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.team.honeybee.domain.MeetingGuestDto;
import com.team.honeybee.service.MeetingGuestService;

@RestController // ajax처리 위해 설정
@RequestMapping("meeting/board/guest")
public class MeetingGuestController {

	@Autowired
	private MeetingGuestService service;

	// 게스트 목록 불러오기
	@GetMapping("list")
	public List<String> selectGuestInfo (int meetingId) {
		
		return service.selectGuestInfo(meetingId);
		
	}
	
	// 꿀비 모임 정해진 인원수 만큼 게스트 등록받기
	@Transactional
	@PostMapping("addGuest")
	public ResponseEntity<String> meeintGuestInfo(MeetingGuestDto guest,
			@RequestParam(value = "meetingId", defaultValue = "0") int meetingId,
			Principal principal) {

		if (principal == null) { // 로그인 페이지로 이동하기로 변경하기
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		} else {
			// 로그인 회원 아이디값 넣기
			List<String> guestList = new ArrayList<>();
			guestList.add(principal.getName());

		}
		System.out.println("로그인 회원" + principal.getName());

		String memberId = principal.getName();

		// 현재 인원수 가져오기
		int cntNum = service.meetingSelectGuest(guest, meetingId);
		System.out.println("현재 인원수" + cntNum);

		// 등록전 존재여부 확인을 가져옴
		String yn = service.guestSelectOverlap(memberId, meetingId);
		System.out.println("중복확인용" + yn);

		// 이미 신청한 사람, 중복 신청 방지
		if ("Y".equals(yn)) {
			// 중복 신청 메세지 출력
			System.out.println("중복확인용" + yn);
			return ResponseEntity.ok("이미 신청하셨습니다! 모임날 만나요~");

		}
		System.out.println("중복확인용" + yn);

		// 등록 가능 & 입력한 ID가 없음
		// 모임 게스트 입력
		if ("N".equals(yn)) {
			service.meetingInsertGuest(memberId, meetingId);
			System.out.println("NO=== " + yn);
			return ResponseEntity.ok("꿀비 모임이 신청되었습니다!");
		}

		// 모임인원이 종료된 경우 메세지 출력
		if (cntNum > guest.getGuestNum()) {
			return ResponseEntity.ok("꿀비들이 다 모였습니다. 다른 모임을 신청해주세요");
		}

		return null;

	}

	// 모임 신청 완료자 취소
	@PostMapping("deleteGuest")
	public ResponseEntity<String> deleteGuest(MeetingGuestDto guest,
			@RequestParam(value = "meetingId", defaultValue = "0") int meetingId,
			Principal principal) {
		System.out.println("11111111");
		// 게시물 정보 얻기
		// MeetingDto meeting = service.getBoardByMeetingId(meeting.getMeetingId());

		System.out.println("2222");

		// 로그인 회원 아이디값 넣기
		String memberId = principal.getName();
		// 널일때 로그인 페이지(나중에 )

		if (StringUtils.isEmpty(memberId)) {

		}
		// meeting.setMemberId(memberId);

		int success = service.meeintGuestDelete(memberId, meetingId);

		if (success > 0) {
			return ResponseEntity.ok("취소가 완료되었습니다.");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("error");
		}

	}
	
}
