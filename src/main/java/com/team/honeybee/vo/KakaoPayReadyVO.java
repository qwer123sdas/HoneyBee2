package com.team.honeybee.vo;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayReadyVO {
    //response
    private String tid, next_redirect_pc_url;
    private String partner_order_id;
    private Date created_at;
    
    //내가 필요해서 만든 property
    private int point;  // 적립금
}
