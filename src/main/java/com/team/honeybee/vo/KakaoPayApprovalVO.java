package com.team.honeybee.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class KakaoPayApprovalVO {
	//response
    private String aid, tid, cid, sid;
    private String partner_order_id, partner_user_id, payment_method_type;//파트너 유저아이디가 로그인 아이디.
    private AmountVO amount;
    private CardVO card_info;
    private String item_name, item_code, payload;
    private Integer quantity, tax_free_amount, vat_amount;
    private Date created_at, approved_at;
}