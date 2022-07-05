package com.team.honeybee.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.team.honeybee.vo.PointVO;

public interface PointMapper {
	// 포인트 적립
	void pointAdd(PointVO vo);
	
	// 회원 총 포인트 가져오기
	int selectSUMPoint(String memberId);
	
	// 회원 포인트 사용기록 작성
	void useMemberPointHistory(Map map);
	

}
