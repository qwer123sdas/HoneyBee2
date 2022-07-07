package com.team.honeybee.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.honeybee.mapper.PointMapper;
import com.team.honeybee.vo.KakaoPayApprovalVO;
import com.team.honeybee.vo.PointVO;

@Service
public class PointService {
	@Autowired
	PointMapper mapper;
	
	// 회원 총 포인트 가져오기
	public int getSUMPoint(String memberId) {
		return mapper.selectSUMPoint(memberId);
	}
	
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
	
	// 사용한 포인트 기록
	public void useMemberPointHistory(String memberId, int point, String comment) {
		Map map = new HashMap<>();
		map.put("memberId", memberId); 
		map.put("point", point);
		map.put("comment", comment);
		mapper.useMemberPointHistory(map);
		System.out.println("오류 확인 : " + map);
	}


	

}
