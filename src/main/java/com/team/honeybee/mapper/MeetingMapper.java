package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.honeybee.domain.MeetingDto;

public interface MeetingMapper {
	
	// 게시글 작성
	int insertMeeting(MeetingDto meeting);

	// 파일 읽기
	void insertFile(@Param("meetingId") int meeting_id, @Param("file") String originalFilename);
	
	// 게시글 목록 보기
	List<MeetingDto> selectMeeting();

	// 기부모임 게시물 보기
	MeetingDto selectBoardByMeetingId(int meetingId);

}
