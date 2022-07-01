package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.team.honeybee.domain.DonationReplyDto;
import com.team.honeybee.vo.DonationReplyVO;

@Mapper
public interface DonationReplyMapper {

	// 댓글 목록
	List<DonationReplyDto> listReplyByBoardId(@Param("donationId")int donationId, @Param("loginId")String loginId);
	
	// 댓글 추가
	int addReply(DonationReplyVO replyVO);


}
