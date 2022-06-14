package com.team.honeybee.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.honeybee.domain.DonationReplyDto;
import com.team.honeybee.mapper.DonationMapper;
import com.team.honeybee.mapper.DonationPayMapper;
import com.team.honeybee.mapper.DonationReplyMapper;

@Service
public class DonationReplyService {
	@Autowired
	DonationReplyMapper replyMapper;
	
	@Autowired
	DonationPayMapper payMapper;
	
	// 댓글 목록
		// 로그인 안할 때
	public List<DonationReplyDto> getReplyByBoardId(int donationId) {
		List<DonationReplyDto> list = replyMapper.listReplyByBoardId(donationId, null);

		return list;
	}
		// 로그인 한 상태일 때
	public List<DonationReplyDto> listReplyWithOwnByBoardId(int donationId, String loginId) {
		//int amount = payMapper.selectDonateMoney(donationId, );
		return replyMapper.listReplyByBoardId(donationId, loginId);
	}
	
	// 댓글 추가
	public void addReply(DonationReplyDto reply) {
		replyMapper.addReply(reply);
	}
	

	

}
