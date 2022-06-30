package com.team.honeybee.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.team.honeybee.vo.KakaoPayApprovalVO;
import com.team.honeybee.vo.KakaoPayReadyVO;
import com.team.honeybee.vo.OrderPayVO;

@Service
@PropertySource("classpath:jdbc.properties")
public class KakaoPayService {
	
	@Autowired
	PointService pointService;

	@Value("${kakao.pay.admin}")
	private String adminKey;
	
	private static final String HOST = "https://kapi.kakao.com";
	
    private KakaoPayReadyVO kakaoPayReadyVO;
	private KakaoPayApprovalVO kakaoPayApprovalVO;
	private OrderPayVO orderPayVO;
	
	
	public String kakaoPayReady(String partner_user_id, OrderPayVO orderpayVO) {
		RestTemplate restTemplate = new RestTemplate();
		
		
		System.out.println(orderPayVO);
		
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
        params.add("item_name", orderpayVO.getProductName());// 상품명
        params.add("quantity", orderpayVO.getQuantity()); // 상품 수량
        params.add("total_amount",  orderpayVO.getFinalPayment()); // 총 금액
        params.add("tax_free_amount", "0"); // 부가세
        params.add("approval_url", "http://localhost:8080/honeybee/market/kakaoPaySuccess?partner_user_id=" + partner_user_id);	// 결제 성공 시 가야할 approval_url
        params.add("cancel_url", "http://localhost:8080/honeybee/market/kakaoPayFail");// 결제 실패 시
        params.add("fail_url", "http://localhost:8080/honeybee/market/kakaoPayCancel/");// 결제 취소 시
 
        // 요청할 부분을 담는 객체
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        
		try {
			//restTemplate를 통해서 kakaoPayReadyVO에 response 담기
			// 요청 URL + 요청할 내용 을 통해 POST 요청을 보내고 결과를, 해당 객체로 반환받는다
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            //kakaoPayReadyVO.setPoint(point);
            // response 중, getNext_redirect_pc_url을 ajax에 보내기
            System.out.println("url " + kakaoPayReadyVO.getNext_redirect_pc_url());
            return kakaoPayReadyVO.getNext_redirect_pc_url();
        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        
        return "";
	}
	
	
	// 카카오 페이 승인 메소드
		public KakaoPayApprovalVO  kakaoPaySuccessInfo(String pg_token, String partner_user_id) {
			System.out.println("토큰 : " + pg_token);
			System.out.println(kakaoPayReadyVO.getTid());
			System.out.println(kakaoPayReadyVO.getPoint());
		
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
				
				// 포인트 사용 여부 기록
				//pointService.useMemberPointHistory(kakaoPayApprovalVO.getPartner_order_id(), kakaoPayReadyVO.getPoint(), "재능판매");
				
	            return kakaoPayApprovalVO;
	        
	        } catch (RestClientException e) {
	            e.printStackTrace();
	        } catch (URISyntaxException e) {
	            e.printStackTrace();
	        }
	        
	        return null;
		}
}