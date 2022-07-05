package com.team.honeybee.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.team.honeybee.mapper.DonationPayMapper;
import com.team.honeybee.vo.DonationReplyVO;
import com.team.honeybee.vo.KakaoPayApprovalVO;
import com.team.honeybee.vo.KakaoPayReadyVO;

@Service
@PropertySource("classpath:jdbc.properties")
public class KakaoPayService {
	
	@Autowired
	PointService pointService;
	
	@Autowired
	OrderService service;
	
	@Autowired
	DonationReplyService replyService;

	@Value("${kakao.pay.admin}")
	private String adminKey;
	
	private static final String HOST = "https://kapi.kakao.com";
	
    private KakaoPayReadyVO kakaoPayReadyVO;
	private KakaoPayApprovalVO kakaoPayApprovalVO;
	
	private DonationReplyVO replyVO;
	
	
	public String kakaoPayReady(String partner_user_id, DonationReplyVO replyVO) {
		RestTemplate restTemplate = new RestTemplate();
		
		
		// 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + adminKey);
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME"); // 가맹점 코드
        params.add("partner_order_id", "partner_order_id"); // 가맹점 주문번호
        params.add("partner_user_id", partner_user_id);// 가맹점 회원 id
        params.add("item_name", replyVO.getProductName());// 상품명
        params.add("quantity", replyVO.getQuantity()); // 상품 수량
        params.add("total_amount", replyVO.getTotalAmount()); // 총 금액
        params.add("tax_free_amount", "20"); // 부가세
        params.add("approval_url", "http://localhost:8080/honeybee/order/kakaoPaySuccess?partner_user_id=" + partner_user_id);	// 결제 성공 시 가야할 approval_url
        params.add("cancel_url", "http://localhost:8080/honeybee/order/kakaoPayFail");// 결제 실패 시
        params.add("fail_url", "http://localhost:8080/honeybee/order/kakaoPayCancel/");// 결제 취소 시
 
        // 요청할 부분을 담는 객체
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        
		try {
			//restTemplate를 통해서 kakaoPayReadyVO에 response 담기
			// 요청 URL + 요청할 내용 을 통해 POST 요청을 보내고 결과를, 해당 객체로 반환받는다
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            kakaoPayReadyVO.setPoint(replyVO.getPoint());  // honeybee 포인트 저장
            this.replyVO = replyVO;
    		
            // response 중, getNext_redirect_pc_url을 ajax에 보내기
            return kakaoPayReadyVO.getNext_redirect_pc_url();
        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        
        return "";
	}
	
	
	// 카카오 페이 승인 메소드
	@Transactional
	public KakaoPayApprovalVO  kakaoPaySuccessInfo(String pg_token, String partner_user_id) {
		System.out.println("토큰 : " + pg_token);
		System.out.println(kakaoPayReadyVO.getTid());
		//System.out.println(kakaoPayReadyVO.getPoint());
	
		RestTemplate restTemplate = new RestTemplate();
		
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + adminKey);
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME"); // 가맹점 코드
        params.add("tid", kakaoPayReadyVO.getTid());   // ready때 담은 tid
        params.add("partner_order_id", "partner_order_id"); // 가맹점 주문번호
        params.add("partner_user_id", partner_user_id);  // 가맹점 회원 id
        params.add("pg_token", pg_token); // 결재 요청시, 성공할 때 받은 토큰
        
        // 요청할 부분을 담는 객체
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
		try {
			// 요청 URL + 요청할 내용 을 통해 POST 요청을 보내고 결과를, 해당 객체로 반환받는다
			kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
			System.out.println("kakaoPayApprovalVO");
			System.out.println(kakaoPayApprovalVO.getPartner_user_id());
			System.out.println(kakaoPayApprovalVO.getQuantity());
			System.out.println(kakaoPayApprovalVO.getItem_name());
			System.out.println("총액 : " + kakaoPayApprovalVO.getAmount().getTotal());
			
			
			// 포인트---------------------------------------
			String comment;
			if(replyVO.getBoardType() == 'D') {
				comment = "기부금";
			}else {
				comment = "재능판매";
			}
			// replyVO.getBoardType() == 'T'  replyVO.getBoardType() == 'M'은 "마켓"
			
			// 포인트 사용 여부 기록
			pointService.useMemberPointHistory(kakaoPayApprovalVO.getPartner_user_id(), kakaoPayReadyVO.getPoint(), comment);
			
			// 포인트 적립
			int resultPayment = kakaoPayApprovalVO.getAmount().getTotal();
			int point = resultPayment / 10; // 10% 적립금
			Date now = new Date(); //유효기간 1년
			Calendar cal = Calendar.getInstance(); 
			cal.setTime(now);
			cal.add(Calendar.YEAR, 1); //1년 더하기
			Date date = cal.getTime();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); // mysql date형식에 맞게 변환
			pointService.pointAdd(kakaoPayApprovalVO.getPartner_user_id(), point, df.format(date), comment);
			
			
			// 게시판-------------------------------------------
			kakaoPayApprovalVO.setProductCode(replyVO.getProductCode());
			
			if(replyVO.getBoardType() == 'D') {
				System.out.println("댓글db가는 중");
				// 기부 댓글 내용  db에 저장 + 총액 계산
				replyService.addReply(replyVO);
				// 기부한 항목 db에 저장 
				service.setKakaoPayData(kakaoPayApprovalVO);
				// 총합 계산
				
			}else {
				// 재능판매 구입항목 db에 저장
				service.setKakaoPayData(kakaoPayApprovalVO);
			}
			
			// replyVO.getBoardType() == 'M' 이면 
			// marketSerivce.add(); 해야함.
			
            return kakaoPayApprovalVO;
        
        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        
        return null;
	}
}
