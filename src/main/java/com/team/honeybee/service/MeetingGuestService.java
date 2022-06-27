package com.team.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.honeybee.domain.MeetingDto;
import com.team.honeybee.domain.MeetingGuestDto;
import com.team.honeybee.mapper.MeetingGuestMapper;

@Service
public class MeetingGuestService {
	
	@Autowired
	private MeetingGuestMapper mapper;
	
	public int meetingSelectGuest(MeetingGuestDto guest, int meetingId) {
//		System.out.println("값 입력");
//		System.out.println(meetingId);
//		System.out.println(meeting.getMeetingId());
//		int cntNum = 0;
//		cntNum = ;
		
		// 현재 인원수 가져오기
		return mapper.meetingSelectGuest(meetingId);
		
	}

	// 게스트 등록전 중복 체크
	public String guestSelectOverlap(String memberId, int meetingId) {
		return mapper.guestSelectOverlap(memberId, meetingId);
	}
	
	// 게스트 입력
	public boolean meetingInsertGuest(String memberId, int meetingId) {
		return mapper.meetingInsertGuest(memberId, meetingId);
		
	}
	
	// 로그인 안한 유저, 게스트 목록 가져오기
	public List<String> selectGuestInfo(int meetingId) {
		
		return mapper.selectGuestInfo(meetingId);
	}
	
	// 모임 신청 완료자 취소
	public int meeintGuestDelete(String memberId, int meetingId) {
		
		return mapper.meeintGuestDelete(memberId, meetingId);
		
	}


}
