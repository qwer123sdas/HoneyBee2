package com.team.honeybee.mapper;

import org.apache.ibatis.annotations.Param;

import com.team.honeybee.domain.MeetingDto;

public interface MeetingMapper {
	
	// meeting main 읽기
	int insertMeeting(MeetingDto meeting);

	// 파일 읽기
	void insertFile(@Param("meeting_id") int meeting_id, @Param("files") String originalFilename);

}
