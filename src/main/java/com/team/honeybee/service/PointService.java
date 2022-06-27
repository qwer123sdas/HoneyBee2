package com.team.honeybee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.honeybee.mapper.PointMapper;
import com.team.honeybee.vo.PointVO;

@Service
public class PointService {
	@Autowired
	PointMapper mapper;
	
	// 포인트 적립
	public void pointAdd(String memberId, int point, String expired, String comment) {
			PointVO vo = new PointVO();
			vo.setMemberId(memberId);
			vo.setComment(comment);
			vo.setExpired(expired);
			vo.setPoint(point);
			System.out.println(vo);
			mapper.pointAdd(vo);
	}
	// 회원 총 포인트 가져오기
	public int getSUMPoint(String memberId) {
		return mapper.selectSUMPoint(memberId);
	}
	
	// 사용한 포인트 기록
	public void useMemberPoint(String memberId) {
		/* return mapper.useMemberPoint() */
	}

}
