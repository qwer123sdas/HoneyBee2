package com.team.honeybee.mapper;

import java.util.*;

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

	MemberDto memberInfo(@Param("memberId") String memberId);
	
	// 회원 탈퇴
	int deleteMemberById(String memberId);
	// 회원 권한 삭제
	void deleteAuthById(String memberId);
	// 회원 정보 수정
	int updateMember(MemberDto dto);
	// 회원 비밀번호 초기화
	void initPwByMemberId(@Param("memberId") String memberId, @Param("pw") String pw);
	// 회원 비밀번호 변경 (마이페이지)
	boolean updatePw(@Param("memberId") String memberId, @Param("newPw") String newPw);
	MemberDto selectMemberById(String memberId);
	// 회원 이메일 가져오기
	String selectEmailById(String memberId);
	// 회원 프로필 사진 업로드
	void updateFile(@Param("memberId") String memberId,@Param("profile")  String profile);
	//상담내용 가져오기
	List<FaqDto> Faqlist(String memberId);
	//상담내용(그림)그림 가져오기
	List<String> selectFileNameById(int questionId);
	//상담내용 제거
	int deleteFaq(int questionId);
    //s3에서 지우고 그림 파일 테이블 삭제
	void deleteFileById(int id);
	//상담 내용 불러오기  
	FaqDto getFaq(int questionId);

}
