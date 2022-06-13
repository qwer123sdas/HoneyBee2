package com.team.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.honeybee.domain.MemberDto;
import com.team.honeybee.mapper.AdminMapper;

@Service
public class AdminService {

	@Autowired
	AdminMapper mapper;
	
	public List<MemberDto> getMember() {
		return mapper.getMember();
	}

	public boolean updateMember(MemberDto member) {
		return mapper.modifyMember(member) == 1;
	}

	public boolean deleteMember(String memberId) {
		return mapper.deleteMember(memberId) == 1;
	}

}
