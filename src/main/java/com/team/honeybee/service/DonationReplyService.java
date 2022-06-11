package com.team.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.honeybee.domain.DonationReplyDto;
import com.team.honeybee.mapper.DonationReplyMapper;

@Service
public class DonationReplyService {
	@Autowired
	DonationReplyMapper mapper;
	
	// 댓글 목록
		// 로그인 안할 때
	public List<DonationReplyDto> getReplyByBoardId(int donationId) {
		return mapper.listReplyByBoardId(donationId, null);
	}
		// 로그인 한 상태일 때
	public List<DonationReplyDto> listReplyWithOwnByBoardId(int donationId, String loginId) {
		return mapper.listReplyByBoardId(donationId, loginId);
	}
	
	// 댓글 추가
	public void addReply(DonationReplyDto reply) {
		mapper.addReply(reply);
	}
	

}
