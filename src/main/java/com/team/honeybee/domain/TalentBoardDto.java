package com.team.honeybee.domain;

import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.util.List;

import lombok.Data;

@Data
public class TalentBoardDto {
	private int talentId;
	
	private String memberId;
	private String nickname;
	
	private String title;
	private String content;
	private String productCode;
	
	private String productName;
	private String price;
	private String selfIntroduction;  // 강사 자기소개
	private String classContent; // 수업 항목

	
	private String workDate;   // 작업일
	private String numberOfPeople; // 최대 수용 인원
	
	private LocalDateTime inserted;
	private int enable;
	
	private String MPhoto;  // 메인 사진
	private List<String> image; // 서머노트 
	private String folderName;
	
	private int mapLevel;
	private String address;
	private String detailAddress;
	
	private int starRating; // 평점
	private String topic;
	
	
	// db에 없는 정보
	private int own;
	
    private int totalPrice; //총 가격(할인 적용된 가격 * 주문 수량)
    private double averageStarRating;
    
    private int starCount;  // 별점 매긴 사람 수
    
	// price액수 단위 화면 표시
	public String getPriceMakedDecimalFormat() {
		DecimalFormat df = new DecimalFormat("###,###");
		return df.format(price);
	}
}
