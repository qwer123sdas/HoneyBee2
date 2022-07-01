package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.honeybee.domain.MeetingSummerNoteDto;

public interface MeetingSummerNoteMapper {
	// db 저장
	void insertImage(MeetingSummerNoteDto SND);

	// url 저장
	void uploadImageUrl(@Param("imageUrl") String imageUrl, @Param("imageId") int imageId);
	
	// url로 image_folder_id 가져오기
	String getImageFolderIdImageUrl(String string);
	
	// 해당 폴더 아이디 이미지 url 모두 가져오기
	List<String> getImageUrlByImageFolderId(String imageFolderId);
	
	// 없는 이름 지우기
	void deleteImage(String imageUrl);
	
	// meetingId 넣어주기
	void setMeetingId(@Param("meetingId")int meetingId, @Param("imageFolderId")String imageFolderId);
	
	

	
	
	

}
