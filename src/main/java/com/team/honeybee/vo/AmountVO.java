package com.team.honeybee.vo;

import lombok.Data;

@Data
public class AmountVO {
	//amount 와 card_info는 JSONObject로 전송받기 때문에
	//따로 AmountVO라는 객체를 만들어 준다.
	private Integer total, tax_free, vat, point, discount;
}