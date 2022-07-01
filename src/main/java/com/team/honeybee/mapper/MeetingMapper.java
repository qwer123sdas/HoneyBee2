package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.honeybee.domain.MeetingDto;

public interface MeetingMapper {
	
	// 게시글 작성
	int insertMeeting(MeetingDto meeting);

	// 메인 사진 저장
	void insertMainPhoto(@Param("meetingId") int meeting_id, 
							@Param("mainPhoto") String mainPhoto, 
							@Param("memberId")String memberId,
							@Param("folderName")String folderName);
	
	// 게시글 목록 보기(topic추가함)
	List<MeetingDto> selectMeeting(@Param("sort") String sort, @Param("topic") String topic);

	// 기부모임 게시물 보기
	MeetingDto selectBoardByMeetingId(int meetingId);

	// 해쉬태그 넣기
	void setHashTag(@Param("hashTag") String hashTag,@Param("meetingId") int meetingId);
	
	// 해쉬 태그 가져오기
	List<String> getHashTag(int meetingId);

	// 현재 인원수 가져오기
	int meetingSelectGuest(int meetingId);

	
	


	
	
	
	

	
	

}
