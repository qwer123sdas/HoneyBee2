package com.team.honeybee.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.honeybee.domain.FaqDto;
import com.team.honeybee.domain.MarketDto;
import com.team.honeybee.domain.MemberDto;
import com.team.honeybee.service.MarketService;

@Controller
@RequestMapping("market")
public class MarketController {
	
	@Autowired
	private MarketService service;
	
	@RequestMapping("list")
	public void marketList(Model model) {
		
		List<MarketDto> list = service.getmarketlist();
		System.out.println(list);
		model.addAttribute("list",list);
	}
	
	@GetMapping("get")
	public void getMarket(int marketId, Model model) {
		MarketDto market = service.getMarketId(marketId);
		System.out.println(market);
		model.addAttribute("market",market);
		
		
		
	}
	
	@GetMapping("cart")
	public void getMarketbuy(@RequestParam("marketId") int marketId, Model model) {
		MarketDto market = service.getMarketById(marketId);
		model.addAttribute("market",market);
	}
	@PostMapping("cart")
	public String postMarketBuyId(MemberDto member,MarketDto dto,RedirectAttributes rttr) {
		System.out.println(member );
		System.out.println(dto);
		
		
		boolean success = service.buyMarketById(member, dto);
		if (success) {
			rttr.addFlashAttribute("message", "구매가 완료 되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "구매가 완료 되지않았습니다..");
		}

		return "redirect:/market/list";
	}
	
	

	
	
}
