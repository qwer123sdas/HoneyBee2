package com.team.honeybee.mapper;

import java.util.List;

import com.team.honeybee.domain.MarketDto;

public interface MarketMapper {

	List<MarketDto> listMarket();

	MarketDto selectMarketId(int marketId);

	List<String> selectFileNameByMarketId(int marketId);

	int updateViewCount(int id);

	int postMakret(MarketDto market);

	int postMakret(int marketId);

	MarketDto getMarketById(int marketId);
	


}
