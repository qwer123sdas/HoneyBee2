package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.honeybee.domain.MeetingDto;

@Mapper
public interface MeetingTagMapper {
	// 해쉬태그별 게시글 가져오기
	List<MeetingDto> getMeetingBoardByHashTag(String hashTag, String sort);

}
