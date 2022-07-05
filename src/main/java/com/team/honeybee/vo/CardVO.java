package com.team.honeybee.vo;

import lombok.Data;

@Data
public class CardVO {
	//amount 와 card_info는 JSONObject로 전송받기 때문에
	// 따로 CardVO라는 객체를 만들어 준다.
    private String purchase_corp, purchase_corp_code;
    private String issuer_corp, issuer_corp_code;
    private String bin, card_type, install_month, approved_id, card_mid;
    private String interest_free_install, card_item_code;
}
