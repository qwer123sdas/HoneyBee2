package com.team.honeybee.mapper;

import java.util.List;

import com.team.honeybee.domain.MeetingDto;
import com.team.honeybee.domain.MeetingReplyDto;

public interface MeetingReplyMapper {
	// 댓글 작성
	int insertMeetingReply(MeetingReplyDto reply);
	// 댓글 리스트
	List<MeetingReplyDto> selectAllMeetingId(int meetingId, Object object);

}
