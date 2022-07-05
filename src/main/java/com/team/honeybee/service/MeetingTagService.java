package com.team.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.honeybee.domain.MeetingDto;
import com.team.honeybee.mapper.MeetingTagMapper;

@Service
public class MeetingTagService {
	
	@Autowired
	private MeetingTagMapper mapper;
	
	// 해쉬태그별 게시글 가져오기
	public List<MeetingDto> getMeetingBoardByHashTag(String hashTag, String sort) {
		
		return mapper.getMeetingBoardByHashTag(hashTag, sort);
	}
	
	
}
