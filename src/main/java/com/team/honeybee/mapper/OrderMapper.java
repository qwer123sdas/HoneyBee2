package com.team.honeybee.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.team.honeybee.domain.TalentBoardDto;
import com.team.honeybee.vo.KakaoPayApprovalVO;

@Mapper
public interface OrderMapper {

	// 구매할 게시판 정보를 결제 페이지로 보내기
	TalentBoardDto selectTalentBoard(int talentId);
	
	// 카카오 페이 승인후, db에 저장
	void insertKakaoPayData(KakaoPayApprovalVO kakaoPayApprovalVo);

}
