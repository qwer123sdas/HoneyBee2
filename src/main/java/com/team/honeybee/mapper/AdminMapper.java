package com.team.honeybee.mapper;

import java.util.List;

import com.team.honeybee.domain.MemberDto;

public interface AdminMapper {

	List<MemberDto> getMember();

	int modifyMember(MemberDto member);

	int deleteMember(String memberId);

}
