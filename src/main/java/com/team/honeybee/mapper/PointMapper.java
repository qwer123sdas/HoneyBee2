package com.team.honeybee.mapper;

import com.team.honeybee.vo.PointVO;

public interface PointMapper {
	// 포인트 적립
	void pointAdd(PointVO vo);
	
	// 회원 총 포인트 가져오기
	int selectSUMPoint(String memberId);

}
