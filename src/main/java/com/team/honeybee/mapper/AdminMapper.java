package com.team.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.honeybee.domain.DonationDto;
import com.team.honeybee.domain.FaqDto;
import com.team.honeybee.domain.MarketDto;
import com.team.honeybee.domain.MeetingDto;
import com.team.honeybee.domain.MemberDto;
import com.team.honeybee.domain.TalentDto;

public interface AdminMapper {

	List<MemberDto> getMember();

	int modifyMember(MemberDto member);

	int deleteMember(String memberId);

	List<DonationDto> getDonationAll();

	List<FaqDto> getFaqAll();

	List<MeetingDto> getMeetingAll();

	int inserMarket(MarketDto market);

	void insertFile(@Param("marketId") int marketId, @Param("file") String file);

	List<MarketDto> getMarketAll();

	MarketDto selectMarketById(int marketId);

	List<String> selectFileNameByMarketId(int marketId);

	int updateMarket(MarketDto dto);

	void deleteFileByMarketIdAndFileName(@Param("marketId") int marketId, @Param("file") String fileName);

	int deleteMarket(int marketId);

	void deleteFileByMarketId(int id);

	MeetingDto getMeetingById(int meetingId);

	DonationDto getDonationById(int donationId);

	List<TalentDto> getTalentAll();

	TalentDto getTalentById(int talentId);

	void registerDonation(int donationId);

	void registerTalent(int talentId);

}
