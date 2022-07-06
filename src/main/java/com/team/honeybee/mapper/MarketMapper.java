package com.team.honeybee.mapper;

import java.util.List;

import com.team.honeybee.domain.MarketDto;
import com.team.honeybee.domain.OrderPayDto;
import com.team.honeybee.vo.DonationReplyVO;
import com.team.honeybee.vo.KakaoPayApprovalVO;

public interface MarketMapper {
	//구매내역리스트    썸내일                                                               
	List<MarketDto> listMarket();
	//marketGet가져오기
	MarketDto selectMarketId(int marketId);
	//마켓get그림 가져오기
	List<String> selectFileNameByMarketId(int marketId);
	//	마켓조회수
	int updateViewCount(int id);
	//주소 적는거 보내는거
	int postMakret(MarketDto market);
	//
	int postMakret(int marketId);
	
	MarketDto getMarketById(int marketId);

	// 구매할 게시판 정보를 결제 페이지로 보내기
    OrderPayDto selectMarketBoard(int orderId);
		
	// 마켓 관련 기타 정보 db에 저장
	void insertKakaoPayETCData(DonationReplyVO donationReplyVO);
	


}
