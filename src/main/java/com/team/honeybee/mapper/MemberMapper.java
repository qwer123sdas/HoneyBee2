package com.team.honeybee.mapper;

import org.apache.ibatis.annotations.*;

import com.team.honeybee.domain.*;

public interface MemberMapper {

	int insertMember(MemberDto member);

	int countMemberId(String memberId);

	int countMemberEmail(String email);

	int countMemberNickName(String nickname);

	int insertAuth(@Param("memberId") String memberId, @Param("auth") String auth);
	
}
