package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.team.honeybee.domain.SummerNoteDto;

@Mapper
public interface SummerNoteMapper {
	// db에 저장
	void insertImage(SummerNoteDto SND);
	// url만 저장
	void uploadImageUrl(@Param("imageUrl")String imageUrl, @Param("imageId")int imageId);
	



	
	//  이미지url로, 관련 image_folder_id가져오기
	String getImageFolderIdImageUrl(String imageUrl);
	
	// imageFolderId에 해당하는 image_url 모두 가져오기
	List<String> getImageUrlByImageFolderId(String imageFolderId);
	
	// 비교 후 없는 이름들 지우기
	void deleteImage(String imageUrl);
	
	

}
