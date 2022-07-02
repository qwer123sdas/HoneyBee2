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
	
	// 부모 댓글 입력
	public boolean insertMeetingReply(MeetingReplyDto reply) {
		
		int cnt = mapper.insertMeetingReply(reply);
		return cnt == 1;
	}

	// 자식 댓글 입력 
	public void insertMeetingReplyChild(MeetingReplyDto reply) {
		// TODO Auto-generated method stub
		
		System.out.println("getRefNum == " + reply.getRefNum());
		System.out.println("getMeetingId == " + reply.getMeetingId());
		System.out.println("getMeetingReplyId == " + reply.getMeetingReplyId());
		
		mapper.insertMeetingReplyChild(reply);
	}
	
	//  댓글 수정
	public void updateMeetingReply(MeetingReplyDto reply) {
		
		mapper.updateMeetingReply(reply);
	}
	
	// 로그인 회원 댓글 삭제(댓글 삭제시 DB에 deleteInfo update됨)
	public void deleteMeetingReply(MeetingReplyDto reply) {
		
		mapper.deleteMeetingReply(reply);
	}
	

	// 댓글 가져오기
	public List<MeetingReplyDto> listReplyByMeetingId(int meetingId) {
		// 부모의 댓글 0, 0, 0을 먼저 가져온다
		List<MeetingReplyDto> parents = mapper.selectParentsByMeetingId(meetingId);
		
		// 부모 댓글의 사이즈만큼 for문이 돌아간다.
		for (int i = 0; i < parents.size(); i++) {
			List<MeetingReplyDto> child = mapper.selectChildByParentId(parents.get(i).getMeetingReplyId());
			// for문을 돌리면서 자식댓글을 부모댓글에 붙여준다.
			parents.addAll(i+1, child);
		}
		// 부모의 자식을 붙여서 최종 리턴해준다.
		
		return parents;
	}
}








