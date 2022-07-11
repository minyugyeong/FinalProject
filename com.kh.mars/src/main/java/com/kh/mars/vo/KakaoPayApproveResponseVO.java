package com.kh.mars.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class KakaoPayApproveResponseVO {
	
	private String aid;
	private String tid;
	private String cid;
	private String sid;
	private String partner_order_id;
	private String partner_user_id;
	private String payment_method_type;
	private AmountVO amount;
	private CardInfoVO card_info;
	private String item_name;
	private String item_code;
	private Integer quantity;
	private Date created_at;
	private Date approved_at;
	private String payload;

}
