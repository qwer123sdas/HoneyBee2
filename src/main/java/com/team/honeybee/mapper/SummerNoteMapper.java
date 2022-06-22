package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.team.honeybee.domain.SummerNoteDto;

@Mapper
public interface SummerNoteMapper {
	// 공용------------------------------------------------------------------------------
	// db에 저장
	void insertImage(SummerNoteDto SND);
	
	// url만 저장
	void uploadImageUrl(@Param("imageUrl")String imageUrl, @Param("imageId")int imageId);
	
	//Donation------------------------------------------------------------------------------
	

	// imageFolderId에 해당하는 image_url 모두 가져오기
	List<String> getImageUrlByImageFolderId(String imageFolderId);
	
	// 비교 후 없는 이름들 지우기
	void deleteImage(String imageUrl);
	//게시글 작성 까지, 업로드 될 이미지에 id넣기
	void setDonationId(@Param("donationId")int donationId, @Param("imageFolderId")String imageFolderId);

	
	//Talent---------------------------------------------------------------------------
	// 게시글 작성 까지, 업로드 될 이미지에 id넣기
	void setTalentIdByTalent(@Param("talentId")int talentId, @Param("imageFolderId")String imageFolderId);
	

}
