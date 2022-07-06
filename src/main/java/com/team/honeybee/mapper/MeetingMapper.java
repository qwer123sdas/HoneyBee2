package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.honeybee.domain.MeetingCommentDto;
import com.team.honeybee.domain.MeetingDto;
import com.team.honeybee.domain.TalentBoardDto;

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

	// 기존 해시태그 삭제
	void deleteHashTagByMeetingId(int meetingId);
	
	// 현재 인원수 가져오기
	int meetingSelectGuest(int meetingId);

	// 후기 입력 모달
	void meetingCommentAdd(@Param("memberId") String memberId, @Param("content") String content);
	
	// 게시글 업데이트
	void updateByMeetingBoard(MeetingDto meeting);

	// 후기 가져오기
	List<MeetingCommentDto> getCommentList();

	// 검색 기능
	List<MeetingDto> selectMeetingBoardBySearch(String keyword);
	
	
	
	

	
	


	
	
	
	

	
	

}
