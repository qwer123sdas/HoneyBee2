package com.team.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.honeybee.domain.DonationDto;
import com.team.honeybee.domain.DonationReplyDto;
import com.team.honeybee.mapper.DonationMapper;
import com.team.honeybee.mapper.DonationPayMapper;
import com.team.honeybee.mapper.DonationReplyMapper;

@Service
public class DonationService {
	@Autowired
	DonationMapper mapper;
	
	@Autowired
	DonationReplyMapper replyMapper;
	
	@Autowired
	DonationPayMapper payMapper;
	
	// 게시글 목록
	public List<DonationDto> findOrder() {
		return mapper.selectOrder();
	}
	
	// 기부 게시글 보기
	public DonationDto getBoard(int donationId) {
		return mapper.getBoard(donationId);
	}

	// [임시] 도네이션 작성 게시판
	public void dontaionBoardWrite(DonationDto dto) {
		mapper.dontaionBoardWrite(dto);
	}
	
	// 기부금 결제
	public void donate(int donationId, int amount, String content, String memberId) {
		// 후기 저장
		DonationReplyDto replyDto = new DonationReplyDto();
		replyDto.setDonationId(donationId);
		replyDto.setContent(content);
		replyDto.setMemberId(memberId);
		replyMapper.addReply(replyDto);
		int replyIdForPay = replyDto.getReplyId();
		
		// 기부금액 저장
		payMapper.donate(amount, memberId, donationId, replyIdForPay);
		
		// 총 모금액 기록
		payMapper.addAmount(donationId);
		
	}

}
