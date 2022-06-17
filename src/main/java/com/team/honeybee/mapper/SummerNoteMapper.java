package com.team.honeybee.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.team.honeybee.domain.SummerNoteDto;

@Mapper
public interface SummerNoteMapper {
	// db에 저장
	void insertImage(SummerNoteDto SND);
	// url만 저장
	void uploadImageUrl(@Param("imageUrl")String imageUrl, @Param("imageId")int imageId);
	
	// 이미지 이름 비교
	int compareImage(String imageUrl);
	// 비교 후 없는 이름들 지우기
	void deleteImage(String imageUrl);
	
	//imageUrl관련 image_id와 image_name 가져오기
	SummerNoteDto getImageDate(String imageUrl);
	
	

}
