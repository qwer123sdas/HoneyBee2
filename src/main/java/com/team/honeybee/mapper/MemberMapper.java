package com.team.honeybee.mapper;

import org.apache.ibatis.annotations.*;

import com.team.honeybee.domain.*;

public interface MemberMapper {

	int insertMember(MemberDto member);

	int countMemberId(String memberId);

	int countMemberEmail(String email);

	int countMemberNickName(String nickname);

	// 회원 권한 주기
	int insertAuth(@Param("memberId") String memberId, @Param("auth") String auth);

	// 아이디 찾기
	int findId(@Param("name")String name, @Param("email") String email);
	// 아이디 가져오기
	String findId2(@Param("name") String name, @Param("email") String email);

	int findPw(@Param("name") String name, @Param("memberId") String memberId, @Param("email")  String email);

	String findPw2(@Param("name") String name, @Param("memberId") String memberId, @Param("email")  String email);

	MemberDto memberInfo(@Param("memberId") String memberId);
	
	// 회원 탈퇴
	int deleteMemberById(String memberId);
	// 회원 권한 삭제
	void deleteAuthById(String memberId);
	// 회원 정보 수정
	int updateMember(MemberDto dto);
	// 회원 비밀번호 초기화
	void initPwByMemberId(@Param("memberId") String memberId, @Param("pw") String pw);
	// 회원 비밀번호 변경
	boolean changePw(MemberDto dto);
	// 회원 이메일 가져오기
	String selectEmailById(String memberId);

}
