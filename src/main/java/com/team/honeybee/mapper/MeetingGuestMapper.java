package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MeetingGuestMapper {

	// 게스트 등록전 중복 체크
	String guestSelectOverlap(@Param("memberId") String memberId, @Param("meetingId") int meetingId);

	// meetingBoard, guest 입력받기
	boolean meetingInsertGuest(@Param("memberId") String memberId, @Param("meetingId") int meetingId);

	// 게스트 목록 가져오기
	List<String> selectGuestInfo(int meetingId);

	// 모임 신청 완료자 취소
	int meeintGuestDelete(@Param("memberId") String memberId, @Param("meetingId") int meetingId);
	
	// 현재 인원수 가져오기
	int meetingSelectGuest(int meetingId);

}
