package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.honeybee.domain.MeetingDto;
import com.team.honeybee.domain.MeetingReplyDto;

public interface MeetingReplyMapper {
	// 댓글 작성
	int insertMeetingReply(MeetingReplyDto reply);
	
	// 댓글 리스트(로그인 안하면 댓글리스트만, 로그인 하면 댓글 입력가능)
	List<MeetingReplyDto> selectAllMeetingId(@Param("meetingId") int meetingId, @Param("memberId") String memberId);
	
	// 댓글입력시 생성번호를 부모 댓글 번호로 넣기
	void updateMeetingReplyParent(MeetingReplyDto reply);
	
	// 댓글 자식 댓글 모두 출력
	List<MeetingReplyDto> selectAllChildrenByParentReplyId(int parentId);

	// 자식 댓글 입력
	void insertMeetingReplyChild(MeetingReplyDto reply);

}
