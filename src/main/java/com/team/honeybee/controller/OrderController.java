package com.team.honeybee.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.google.gson.JsonObject;
import com.team.honeybee.domain.TalentBoardDto;
import com.team.honeybee.service.KakaoPayService;
import com.team.honeybee.service.OrderService;
import com.team.honeybee.vo.KakaoPayApprovalVO;
import com.team.honeybee.vo.KakaoPayReadyVO;

@Controller
@PropertySource("classpath:jdbc.properties")
public class OrderController {
	@Autowired
	OrderService service;
	
	@Autowired
	KakaoPayService kakaopayService;
	
	@RequestMapping("cart")
	public void test() {
		
	}
    
    private KakaoPayReadyVO kakaoPayReadyVO;
	private KakaoPayApprovalVO kakaoPayApprovalVO;
	
	// 구매할 게시판 정보를 결제 페이지로 보내기
	@GetMapping("order/cart/{talentId}")
	public String cartPage(@PathVariable int talentId, Model model, Principal principal) {
		TalentBoardDto dto = service.selectTalentBoard(talentId);
		
		model.addAttribute("board", dto);
		model.addAttribute("memberId", principal.getName());
		return "order/cart";
	}
	
	
	// 카카오 페이 요청
	@GetMapping("kakaopay")
	@ResponseBody
	public String kakaoPayReady(Principal principal, String productName, String finalPayment, String amount) {
			System.out.println(principal.getName());
			System.out.println(productName);
			System.out.println(finalPayment.split("원"));
			System.out.println(amount);
			
			String partner_order_id = principal.getName();
			String[] finalPaymentArray= finalPayment.split("원");
			if(finalPaymentArray[0] != "0") {
				// 카카오 결제 준비하기	- 결제요청 service 실행.
				return kakaopayService.kakaoPayReady(partner_order_id, productName, amount, finalPaymentArray[0]);
			}
			return kakaopayService.kakaoPayReady(partner_order_id, productName, amount, finalPaymentArray[0]);
			//return "redirect:/order/success";
			
	}
	
	// 카카오 페이 승인
	@RequestMapping("order/kakaoPaySuccess")
	public String kakaoPaySuccessPage(@RequestParam("pg_token") String pg_token, 
									  Model model) {
		
		KakaoPayApprovalVO kakaoPayApprovalVo = kakaopayService.kakaoPaySuccessInfo(pg_token);
		System.out.println(kakaoPayApprovalVo);
		//db저장
		service.setKakaoPayData(kakaoPayApprovalVo);
		return "redirect:/order/success";
	}
	
	
	@RequestMapping("order/success")
	public void successPage() {
		
	}
	
}
