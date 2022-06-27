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
import com.team.honeybee.service.PointService;
import com.team.honeybee.vo.KakaoPayApprovalVO;
import com.team.honeybee.vo.KakaoPayReadyVO;

@Controller
@PropertySource("classpath:jdbc.properties")
public class OrderController {
	@Autowired
	OrderService service;
	
	@Autowired
	KakaoPayService kakaopayService;
	
	@Autowired
	PointService pointService;
	
	@RequestMapping("cart")
	public void test() {
		
	}
	
	// 구매할 게시판 정보를 결제 페이지로 보내기
	@GetMapping("order/cart/{talentId}")
	public String cartPage(@PathVariable int talentId, Model model, Principal principal) {
		TalentBoardDto dto = service.selectTalentBoard(talentId);
		
		// 회원 총 포인트 가져오기
		int memberTotalPoint = pointService.getSUMPoint(principal.getName());
		
		model.addAttribute("board", dto);
		model.addAttribute("memberId", principal.getName());
		model.addAttribute("memberPoint", memberTotalPoint);
		return "order/cart";
	}
	
	
	// 카카오 페이 요청
	@GetMapping("kakaopay")
	@ResponseBody
	public String kakaoPayReady(Principal principal, String productName, String quantity, String totalAmount, int point) {
			String partner_user_id = principal.getName();
			if(totalAmount != "0") {
				// 카카오 결제 준비하기	- 결제요청 service 실행.
				return kakaopayService.kakaoPayReady(partner_user_id, productName, quantity, totalAmount, point);
			}
			// 바로 결제처리해야됨.
			return kakaopayService.kakaoPayReady(partner_user_id, productName, quantity, totalAmount, point);
			//return "redirect:/order/success";
			
	}
	
	// 카카오 페이 승인
	@Transactional
	@RequestMapping("order/kakaoPaySuccess")
	public String kakaoPaySuccessPage(@RequestParam("pg_token") String pg_token, 
									  @RequestParam("partner_user_id")String partner_user_id,
									  Model model) {
		
		KakaoPayApprovalVO kakaoPayApprovalVo = kakaopayService.kakaoPaySuccessInfo(pg_token, partner_user_id);
		System.out.println("?? : " + kakaoPayApprovalVo);
		//db저장
		service.setKakaoPayData(kakaoPayApprovalVo);
		
		
		return "redirect:/order/success";
	}
	
	
	// 카카오페이 승인 완료시 갈 사이트
	@RequestMapping("order/success")
	public void successPage() {
	}
	// 카카오페이 취소 시 갈 사이트
	@RequestMapping("order/kakaoPayFail")
	public void failPage() {
	}
	
}
