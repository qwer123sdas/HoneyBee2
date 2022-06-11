package com.team.honeybee.domain;

import lombok.Data;

@Data
public class DonationReplyDto {
	private int replyId;
	private int donationId;
	private String memberId;
	
	private String nickname;
	private String content;
	private String inserted;
	private boolean own;
}
