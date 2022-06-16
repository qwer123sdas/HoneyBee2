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
	String findId2(@Param("name") String name, @Param("email") String email);

	int findPw(@Param("name") String name, @Param("memberId") String memberId, @Param("email")  String email);

	String findPw2(@Param("name") String name, @Param("memberId") String memberId, @Param("email")  String email);

	MemberDto memberInfo(@Param("memberId") String memberId,@Param("name") String name, 
			@Param("email") String email, @Param("nickname") String nickname, @Param("postcode") String postcode, 
			@Param("address")String address, @Param("detail") String detail, @Param("phone") String phone);
	
}
