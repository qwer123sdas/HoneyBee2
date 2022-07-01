package com.team.honeybee.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface DonationPayMapper {
	// 기부금 db 저장
	void donate(@Param("amount")String amount, 
				@Param("memberId")String memberId,
				@Param("donationId") int donationId,
				@Param("replyIdForPay") int replyIdForPay);
	
	// 총 모금액 기록
	void addAmount(int donationId);
}
