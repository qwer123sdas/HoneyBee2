package com.team.honeybee.mapper;

import org.apache.ibatis.annotations.Param;

import com.team.honeybee.domain.FaqDto;

public interface FaqMapper {

	int insertBoard(FaqDto faq);

}
