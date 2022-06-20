package com.team.honeybee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.team.honeybee.domain.MarketDto;
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
	
	
	
}
