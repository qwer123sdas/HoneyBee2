package com.team.honeybee.domain;

import lombok.Data;

@Data
public class DonationReplyDto {
	private int reply_id;
	private int donation_id;
	private int member_id;
	private String content;
	private String date;
}
