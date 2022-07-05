package com.team.honeybee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.honeybee.domain.MeetingDto;
import com.team.honeybee.service.MeetingTagService;

@Controller
public class MeetingTag {
	
	@Autowired
	private MeetingTagService service;
	
	// 해쉬태그별 게시글 가져오기
	@RequestMapping("meeting/tags/{hashTag}")
	public String selectMeetingBoardByHashTag(@PathVariable String hashTag, 
			@RequestParam(name="sort", defaultValue = "") String sort, Model model) {
		
		List<MeetingDto> meetingList = service.getMeetingBoardByHashTag(hashTag, sort);
		model.addAttribute("meetingList", meetingList);
		model.addAttribute("hashTag", hashTag);
		
		return "meeting/tags";
	}

	
	
}
