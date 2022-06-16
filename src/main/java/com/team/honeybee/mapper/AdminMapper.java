package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.honeybee.domain.DonationDto;
import com.team.honeybee.domain.FaqDto;
import com.team.honeybee.domain.MarketDto;
import com.team.honeybee.domain.MeetingDto;
import com.team.honeybee.domain.MemberDto;

public interface AdminMapper {

	List<MemberDto> getMember();

	int modifyMember(MemberDto member);

	int deleteMember(String memberId);

	List<DonationDto> getDonationAll();

	List<FaqDto> getFaqAll();

	List<MeetingDto> getMeetingAll();

	int inserMarket(MarketDto market);

	void insertFile(@Param("market_id") int market_id, @Param("file") String file);

	List<MarketDto> getMarketAll();

	MarketDto selectMarketById(int market_id);

	List<String> selectFileNameByMarketId(int market_id);

	int updateMarket(MarketDto dto);

	void deleteFileByMarketIdAndFileName(@Param("market_id") int market_id, @Param("file") String fileName);

	int deleteMarket(int market_id);

	void deleteFileByMarketId(int id);

}
