package com.team.honeybee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.honeybee.domain.FavoriteDto;
import com.team.honeybee.service.FavoriteService;

@Controller
@RequestMapping("favorite")
public class FavoriteController {
	@Autowired
	FavoriteService service;
	
	// 좋아요 클릭 할 때 처리하는 컨트롤러
	@PostMapping("click")
	@ResponseBody
	@Transactional
	public FavoriteDto favorite(FavoriteDto dto) {
		// 좋아요 있는지 확인
		int result = service.insertFavorite(dto);
		int count = 0;
		// 좋아요 갯수 확인
		if(dto.getType() == 'D') {
			count =  service.countHeart(dto.getDonationId());
		}else {
			
		}
		
		dto.setCount(count);
		dto.setExit(result);
		return dto;
	}
}
