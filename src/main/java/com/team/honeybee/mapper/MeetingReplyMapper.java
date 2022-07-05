package com.team.honeybee.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.honeybee.domain.MeetingDto;
import com.team.honeybee.domain.MeetingReplyDto;

public interface MeetingReplyMapper {
	// 부모 댓글 입력
	int insertMeetingReply(MeetingReplyDto reply);
	
	// 자식 댓글 입력
	void insertMeetingReplyChild(MeetingReplyDto reply);
	
	// 댓글 리스트(로그인 안하면 댓글리스트만, 로그인 하면 댓글 입력가능)
	List<MeetingReplyDto> selectAllMeetingId(@Param("meetingId") int meetingId, @Param("memberId") String memberId);
		
	// 미팅아이디로 최상위부모댓글 SELECT
	List<MeetingReplyDto> selectParentsByMeetingId(int meetingId);

	// 댓글 자식 댓글 모두 출력
	List<MeetingReplyDto> selectChildByParentId(int meetingReplyId);
	
	
	// 댓글 수정
	void updateMeetingReply(MeetingReplyDto reply);
		
	// 로그인 회원 댓글 삭제(댓글 삭제시 DB에 deleteInfo update됨)
	void deleteMeetingReply(MeetingReplyDto reply);

	List<MeetingReplyDto> selectAllChildrenByParentReplyId(@Param("meetingId") int meetingId);
	

}
