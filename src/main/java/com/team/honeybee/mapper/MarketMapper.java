package com.team.honeybee.mapper;

import java.util.List;

import com.team.honeybee.domain.MarketDto;
import com.team.honeybee.domain.OrderPayDto;
import com.team.honeybee.vo.KakaoPayApprovalVO;

public interface MarketMapper {
	                                                                        
	List<MarketDto> listMarket();

	MarketDto selectMarketId(int marketId);

	List<String> selectFileNameByMarketId(int marketId);

	int updateViewCount(int id);

	int postMakret(MarketDto market);

	int postMakret(int marketId);

	MarketDto getMarketById(int marketId);

	// 구매할 게시판 정보를 결제 페이지로 보내기
    OrderPayDto selectMarketBoard(int orderId);
		
		// 카카오 페이 승인후, db에 저장
	void insertKakaoPayData(KakaoPayApprovalVO kakaoPayApprovalVo);
	


}
