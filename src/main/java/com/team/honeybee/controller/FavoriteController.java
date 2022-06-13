package com.team.honeybee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public FavoriteDto favorite(FavoriteDto dto) {
		int result = service.insertFavorite(dto);
		int count =  service.countHeart(dto.getDonationId());
		dto.setCount(count);
		dto.setExit(result);
		
		return dto;
	}
}
