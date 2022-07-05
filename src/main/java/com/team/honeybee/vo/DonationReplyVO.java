package com.team.honeybee.vo;

import lombok.Data;

@Data
public class DonationReplyVO {
	// 공동 property
	private String productName;
	private String quantity;
	private String totalAmount;
	private int point;
	private char boardType;
	private String productCode;
	
	// 기부 게시판 property
	private int replyId;
	
	private int donationId;
	private String content;
	private String memberId;
	
	// 마켓 게시판 property
	
	// 재능판메 게시판 property는 없음
	
}
