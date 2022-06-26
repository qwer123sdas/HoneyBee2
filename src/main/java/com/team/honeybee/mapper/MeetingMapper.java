package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.honeybee.domain.MeetingDto;

public interface MeetingMapper {
	
	// 게시글 작성
	int insertMeeting(MeetingDto meeting);

	// 파일 읽기
	void insertFile(@Param("meetingId") int meeting_id, @Param("file") String originalFilename);
	
	// 게시글 목록 보기(topic추가함)
	List<MeetingDto> selectMeeting(@Param("sort") String sort, @Param("topic") String topic);

	// 기부모임 게시물 보기
	MeetingDto selectBoardByMeetingId(int meetingId);

	// 해쉬태그 넣기
	void setHashTag(@Param("hashTag") String hashTag, int meetingId);
	
	// 해쉬 태그 가져오기
	List<String> getHashTag(int meetingId);

	// 현재 인원수 가져오기
	int meetingSelectGuest(int meetingId);

	// 게스트 등록전 중복 체크
	String guestSelectOverlap(@Param("memberId") String memberId, @Param("meetingId") int meetingId);
	
	// meetingBoard, guest 입력받기
	boolean meetingInsertGuest(@Param("memberId") String memberId, @Param("meetingId") int meetingId);
	
	// 게스트 목록 가져오기
	List<String> selectGuestInfo(int meetingId);

	//모임 신청 완료자 취소
	int meeintGuestDelete(@Param("memberId") String memberId, @Param("meetingId") int meetingId);
	
	
	


	
	
	
	

	
	

}
