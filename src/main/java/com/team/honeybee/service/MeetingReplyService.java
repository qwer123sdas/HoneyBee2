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
		List<MeetingReplyDto> replyList = mapper.selectAllMeetingId(meetingId, memberId);
		System.out.println(meetingId);
		System.out.println(memberId);
		return replyList;
	}
	
	// 본글에 대한 자식 여부 
	
	
	
	// 로그인 회원 댓글입력 
	@Transactional
	public boolean insertMeetingReply(MeetingReplyDto reply) {
		
		int cnt = mapper.insertMeetingReply(reply);
		// 댓글입력시 생성번호를 부모 댓글 번호로 넣기
		// reply.setMeetingReplyParent(reply.getMeetingReplyId());
		// reply.setMeetingReplyGnum(reply.getMeetingReplyId());
		// mapper.updateMeetingReplyParent(reply);

	
		return cnt == 1;
	}

	// 자식 댓글 입력 메소드 
	public void insertMeetingReplyChild(MeetingReplyDto reply) {
		// TODO Auto-generated method stub
		
		System.out.println("getRefNum == " + reply.getRefNum());
		System.out.println("getMeetingId == " + reply.getMeetingId());
		System.out.println("getMeetingReplyId == " + reply.getMeetingReplyId());
		
		mapper.insertMeetingReplyChild(reply);
	}
	
	//  글 수정
	public void updateMeetingReply(MeetingReplyDto reply) {
		// TODO Auto-generated method stub
		
		mapper.updateMeetingReply(reply);
	}
	
	//  글 삭제
	public void deleteMeetingReply(MeetingReplyDto reply) {
		// TODO Auto-generated method stub
		
		
		mapper.deleteMeetingReply(reply);
	}
	
	
	
	// 댓글 가져오기
	public List<MeetingReplyDto> listReplyByMeetingId(int meetingId) {
		List<MeetingReplyDto> parents = mapper.selectParentsByMeetingId(meetingId);
		
		for (int i = 0; i < parents.size(); i++) {
			List<MeetingReplyDto> child = mapper.selectChildByParentId(parents.get(i).getMeetingReplyId());
			parents.addAll(i+1, child);
		}
		
		return parents;
	}
}








