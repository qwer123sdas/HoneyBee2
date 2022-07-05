package com.team.honeybee.controller;

import java.security.Principal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.honeybee.domain.DonationReplyDto;
import com.team.honeybee.domain.TalentBoardDto;
import com.team.honeybee.service.DonationReplyService;
import com.team.honeybee.service.KakaoPayService;
import com.team.honeybee.service.OrderService;
import com.team.honeybee.service.PointService;
import com.team.honeybee.vo.DonationReplyVO;
import com.team.honeybee.vo.KakaoPayApprovalVO;
import com.team.honeybee.vo.TalentVO;

@Controller
@PropertySource("classpath:jdbc.properties")
public class OrderController {
	@Autowired
	OrderService service;
	
	@Autowired
	KakaoPayService kakaopayService;
	
	@Autowired
	PointService pointService;
	
	@Autowired
	DonationReplyService replyService;
	
	@RequestMapping("cart")
	public void test() {
		
	}
	
	DonationReplyVO replyVO;
	
	// 구매할 게시판 정보를 결제 페이지로 보내기
	@GetMapping("order/cart/{talentId}")
	public String cartPage(@PathVariable int talentId, Model model, Principal principal) {
		TalentBoardDto dto = service.selectTalentBoard(talentId);
		
		// 수업 항목 list로 보내기
		String classContents = dto.getClassContent();
		String[] classContentList = classContents.substring(1).split("/");
		
		// 회원 총 포인트 가져오기
		int memberTotalPoint = pointService.getSUMPoint(principal.getName());
		
		model.addAttribute("board", dto);
		model.addAttribute("classContentList", classContentList);
		model.addAttribute("memberId", principal.getName());
		model.addAttribute("memberPoint", memberTotalPoint);
		return "order/cart";
	}
	
	
	// 카카오 페이 요청(기부 게시판 + 재능판매 + 마켓)
	@PostMapping(path="kakaopay", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String kakaoPayReady(Principal principal,@RequestBody DonationReplyVO replyVO) {
		String partner_user_id = principal.getName();
		
		System.out.println(replyVO);
		
		replyVO.setMemberId(partner_user_id);
		this.replyVO = replyVO;
		
		if(replyVO.getTotalAmount() != "0") {
			// 카카오 결제 준비하기	- 결제요청 service 실행.
			System.out.println("요청준비");
			return kakaopayService.kakaoPayReady(partner_user_id, replyVO);
		}
		
		
		// 무료라서 바로 결제처리해야됨.
		return kakaopayService.kakaoPayReady(partner_user_id, replyVO);
		//return "redirect:/order/success";
			
	}
	

	// 카카오 페이 승인
	@Transactional
	@RequestMapping("order/kakaoPaySuccess")
	public String kakaoPaySuccessPage(@RequestParam("pg_token") String pg_token, 
									  @RequestParam("partner_user_id")String partner_user_id,
									  Model model) {
		
		KakaoPayApprovalVO kakaoPayApprovalVo = kakaopayService.kakaoPaySuccessInfo(pg_token, partner_user_id);
		
		
		
		
		// 아래 부분 서비스에 전부 처리하도록 하기
		
		if(replyVO.getBoardType() == 'D') {
			// 기부 게시판
			return "redirect:/donation/board/" + replyVO.getDonationId();
		}else if(replyVO.getBoardType() == 'T') {
			// 재능 판매 게시판
			return "redirect:/order/success";
		}
		// 마켓 게시판
		return "redirect:/market/success";
	}
	
	
	// 카카오페이 승인 완료시 갈 사이트
	@RequestMapping("order/success")
	public void successPage() {
	}
	// 카카오페이 취소 시 갈 사이트
	@RequestMapping("order/kakaoPayFail")
	public void failPage() {
	}
	
	@RequestMapping("order/point")
	public void tempPoint() {
		
	}
	
	
}
