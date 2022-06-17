package com.team.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.honeybee.domain.MeetingReplyDto;
import com.team.honeybee.mapper.MeetingReplyMapper;

@Service
public class MeetingReplyService {

	@Autowired
	private MeetingReplyMapper mapper;

	// 로그인 하지 않은 회원 댓글 리스트만 보여주기
	public List<MeetingReplyDto> getReplyByMeetingId(int meetingId) {
		return getReplyWithOwnMeetingId(meetingId, null);
	}
	// 로그인 회원 정보 담은 댓글 리스트
	public List<MeetingReplyDto> getReplyWithOwnMeetingId(int meetingId, String memberId) {
		List<MeetingReplyDto> list = mapper.selectAllMeetingId(meetingId, memberId);
		
		addChildren(list);
		
		return list;
	}
	private void addChildren(List<MeetingReplyDto> list) {
		for (MeetingReplyDto dto : list) {
			
			List<MeetingReplyDto> childen = mapper.selectAllChildrenByParentReplyId(dto.getMeetingReplyId());
			
			dto.setChilden(childen);
			
			// 자식의자식
			addChildren(childen);
		}
	}
	
	// 로그인 회원 댓글입력 
	@Transactional
	public boolean insertMeetingReply(MeetingReplyDto reply) {
		
		int cnt = mapper.insertMeetingReply(reply);
		// 댓글입력시 생성번호를 부모 댓글 번호로 넣기
		reply.setMeetingReplyParent(reply.getMeetingReplyId());
		reply.setMeetingReplyGnum(reply.getMeetingReplyId());
		mapper.updateMeetingReplyParent(reply);

	
		return cnt == 1;
	}
	
	
	

}
