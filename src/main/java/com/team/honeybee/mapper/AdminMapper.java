package com.team.honeybee.mapper;

import java.util.List;

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

}
