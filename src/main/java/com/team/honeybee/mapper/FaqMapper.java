package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.team.honeybee.domain.FaqDto;

public interface FaqMapper {

	int insertBoard(FaqDto faq);

	void insertFile(@Param("questionId") int questionId,@Param("fileName") String fileName);

	List<FaqDto> Faqlist();

	FaqDto getFaq(int questionId);

	int deleteFaq(int questionId);

	void deleteFileById(int questionId);

	List<String> selectFileNameById(int questionId);

}
