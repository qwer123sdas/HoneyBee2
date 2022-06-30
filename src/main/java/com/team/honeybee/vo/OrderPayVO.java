package com.team.honeybee.vo;

import lombok.Data;

@Data
public class OrderPayVO {
	private String productName;
	private String quantity;
	private String finalPayment;
	private String orderName; // 주문입력
	private int postCode;
	private String address;
	private String detailAddress;
	private String phone;
	private String comment;
	
}
