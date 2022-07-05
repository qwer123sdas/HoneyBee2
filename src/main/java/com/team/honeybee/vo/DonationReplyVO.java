package com.team.honeybee.vo;

import lombok.Data;

@Data
public class DonationReplyVO {
	// 공동 property
	private int orderId;
	private String productName;
	private String quantity;
	private String totalAmount;  // finalPayment  ???
	private int point;
	private char boardType;
	private String productCode;
	
	// 기부 게시판 property
	private int replyId;
	
	private int donationId;
	private String content;
	private String memberId;
	
	// 마켓 게시판 property
	private int marketId;
	private String orderName; // 주문입력
	private int postCode;
	private String address;
	private String detailAddress;
	private String phone;
	private String comment;
	
	// 재능판메 게시판 property는 없음
	
}
