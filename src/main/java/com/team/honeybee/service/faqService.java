package com.team.honeybee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.honeybee.domain.faqDto;
import com.team.honeybee.mapper.faqMapper;



@Service
public class faqService {

	@Autowired
	private faqMapper mapper;

	public boolean addBoard(faqDto faq) {
		int cnt = mapper.insertBoard(faq);
		return cnt == 1;
	}	
	
}
