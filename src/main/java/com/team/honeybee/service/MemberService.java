package com.team.honeybee.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.team.honeybee.domain.*;
import com.team.honeybee.mapper.*;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	public boolean addMember(MemberDto member) {
		
		return mapper.insertMember(member) == 1;
	}
	
}
