package com.team.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.honeybee.domain.MeetingReplyDto;
import com.team.honeybee.mapper.MeetingReplyMapper;

@Service
public class MeetingReplyService {

	@Autowired
	private MeetingReplyMapper mapper;

	// 댓글 리스트 로그인 하지 않은 회원
	public List<MeetingReplyDto> getReplyByMeetingId(int meetingId) {
		return mapper.selectAllMeetingId(meetingId, null);
	}
	// 로그인 회원 정보 담은 댓글 리스트
	public List<MeetingReplyDto> getReplyWithOwnMeetingId(int meetingId, String memberId) {
		return mapper.selectAllMeetingId(meetingId, memberId);
	}
	
	public boolean insertMeetingReply(MeetingReplyDto reply) {
		return mapper.insertMeetingReply(reply) == 1;
	}
	
	
	

}
