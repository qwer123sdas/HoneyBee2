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

	List<TalentDto> getTalentAll();

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

	TalentDto getTalentById(int talentId);
	
	FaqDto getFaqById(int questionId);

	void registerDonation(int donationId);

	void registerTalent(int talentId);
	
	DonationDto selectFolderNameAndMPhotoByDonationId(int donationId);
	
	TalentDto selectFolderNameAndMPhotoByTalentId(int talentId);

	MeetingDto selectFolderNameAndMainPhotoByMeetingId(int meetingId);

	void deleteBoardImageByTalentId(int talentId);

	void deleteTalentReviewByTalentId(int talentId);

	void deleteTalentByTalentId(int talentId);

	void deleteBoardImageByDonationId(int donationId);

	void deleteTagByDonationId(int donationId);

	void deleteFavoriteByDonationId(int donationId);

	void deleteDonationPayByDonationId(int donationId);

	void deleteDonationReplyByDonationId(int donationId);

	void deleteDonationByDonationId(int donationId);

	void deleteBoardImageByMeetingId(int meetingId);

	void deleteMeetingGuestByMeetingId(int meetingId);

	void deleteMeetingCommentByMeetingId(int meetingId);

	void deleteMeetingReplyByMeetingId(int meetingId);

	void deleteMeetingByMeetingId(int meetingId);

	void deleteFavoriteByMeetingReplyId(int meetingId);

	List<String> selectFileNameByFaqId(int questionId);

	void deleteFileByFaqId(int questionId);

	int deleteFaqById(int questionId);

	boolean modifyFaqEnableById(int questionId);

	List<String> selectFileNameByDonationId(int donationId);

	List<String> selectFileNameByTalentId(int talentId);

	List<String> selectFileNameByMeetingId(int meetingId);

	String selectProfileByMemberId(String memberId);

	int sumDonationAll();


}
