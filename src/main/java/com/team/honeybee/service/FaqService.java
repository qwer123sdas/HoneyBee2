package com.team.honeybee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.honeybee.domain.FaqDto;
import com.team.honeybee.mapper.FaqMapper;



@Service
public class FaqService {

	@Autowired
	private FaqMapper mapper;

	public boolean addBoard(FaqDto faq) {
		faq.setMember_id("admin");
		int cnt = mapper.insertBoard(faq);
		return cnt == 1;
	}	
	
}
