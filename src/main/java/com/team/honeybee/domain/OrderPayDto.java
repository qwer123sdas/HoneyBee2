package com.team.honeybee.domain;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class OrderPayDto {

	private int orderId;
	private String memberId;
	private String productName;
	private String finalPayment; // 최종금액
	private String amount; // quantity
	private String orderName; // 주문자
	private int postCode;
	private String address;
	private String detailAddress;
	private String phone;
	private String comment;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern="yyyy-MM-dd HH-mm-ss")
	private LocalDateTime inserted;
	private String productCode;
	
	
	
}
