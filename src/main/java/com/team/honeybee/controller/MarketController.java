package com.team.honeybee.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.honeybee.domain.FaqDto;
import com.team.honeybee.domain.MarketDto;
import com.team.honeybee.domain.MemberDto;
import com.team.honeybee.domain.OrderPayDto;
import com.team.honeybee.service.KakaoPayService;
import com.team.honeybee.service.MarketService;
import com.team.honeybee.service.PointService;
import com.team.honeybee.vo.KakaoPayApprovalVO;
import com.team.honeybee.vo.KakaoPayReadyVO;
import com.team.honeybee.vo.OrderPayVO;

@Controller
@PropertySource("classpath:jdbc.properties")
@RequestMapping("market")
public class MarketController {
	
	@Autowired
	private MarketService service;
	@Autowired
	private KakaoPayService kakaopayService;
	@Autowired
	PointService pointService;

	@RequestMapping("cart")
	public void test() {
		
	}
	private KakaoPayReadyVO kakaoPayReadyVO;
	private KakaoPayApprovalVO kakaoPayApprovalVO;
	
	//물품 리스트
	@RequestMapping("list")
	public void marketList(Model model) {
		
		List<MarketDto> list = service.getmarketlist();
		System.out.println(list);
		model.addAttribute("list",list);
	}
	//마켓 내용 
	@GetMapping("get")
	public void getMarket(int marketId, Model model) {
		MarketDto market = service.getMarketId(marketId);
		System.out.println(market);
		model.addAttribute("market",market);
		
		
		
	}
	// 마켓 구매 페이지
	@GetMapping("cart")
	public void getMarketbuy(@RequestParam("marketId") int marketId, Model model) {
		MarketDto market = service.getMarketById(marketId);
		model.addAttribute("market",market);
	}
	
	
	
	
	 //구매할 게시판 정보를 결제 페이지로 보내기
	/*	@GetMapping("market/cart/{marketId}")
		public String cartPage(@PathVariable int orderId, Model model, Principal principal) {
			OrderPayDto order = service.selectMarketBoard(orderId);
		
			int memberTotalPoint = pointService.getSUMPoint(principal.getName());
			
			model.addAttribute("order", order);
			model.addAttribute("memberId", principal.getName());
			model.addAttribute("memberPoint", memberTotalPoint);
			return "market/cart";
		}*/
		
		
		
	
}
