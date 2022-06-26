package com.team.honeybee.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class TalentBoardDto {
	private int talentId;
	
	private String memberId;
	private String nickname;
	
	private String title;
	private String content;
	
	private String productName;
	private String price;
	/* 상품 한개 구매 시 획득 포인트 */
    private int savePoint;
	
	private String workDate;   // 작업일
	private String numberOfPeople; // 최대 수용 인원
	
	private LocalDateTime inserted;
	private String expired;
	
	private String MPhoto;  // 메인 사진
	private String image; // 서머노트 
	private String folderName;
	
	private int mapLevel;
	private String address;
	
	private int starRating; // 평점
	private String topic;
	
	// db에 없는 정보
    private int salePrice; // 할인 적용된 가격 
    private int totalPrice; //총 가격(할인 적용된 가격 * 주문 수량)
    private int totalSavePoint; // 총 획득 포인트(상품 한개 구매 시 획득 포인트 * 수량) 
}
