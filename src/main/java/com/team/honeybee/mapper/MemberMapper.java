package com.team.honeybee.mapper;

import org.apache.ibatis.annotations.*;

import com.team.honeybee.domain.*;

public interface MemberMapper {

	int insertMember(MemberDto member);

	int countMemberId(String memberId);

	int countMemberEmail(String email);

	int countMemberNickName(String nickname);

	int insertAuth(@Param("memberId") String memberId, @Param("auth") String auth);

	// 아이디 찾기
	int findId(@Param("name")String name, @Param("email") String email);
	// 아이디 가져오기
	String findId2(@Param("name")String name, @Param("email") String email);

	
	MemberDto selectMemberBtId(String memberId);
	
}
