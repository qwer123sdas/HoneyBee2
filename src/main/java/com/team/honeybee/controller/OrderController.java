package com.team.honeybee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.honeybee.domain.TalentBoardDto;
import com.team.honeybee.service.OrderService;

@Controller
@RequestMapping("order")
public class OrderController {
	@Autowired
	OrderService service;
	
	@RequestMapping("cart")
	public void test() {
		
	}
	
	// 구매할 게시판 정보를 결제 페이지로 보내기
	@GetMapping("cart/{talentId}")
	public String cartPage(@PathVariable int talentId, Model model) {
		TalentBoardDto dto = service.selectTalentBoard(talentId);
		
		model.addAttribute("board", dto);
		return "order/cart";
	}
}
