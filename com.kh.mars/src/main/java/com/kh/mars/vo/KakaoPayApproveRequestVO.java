package com.kh.mars.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class KakaoPayApproveRequestVO {
	
	private String cid;
	private String tid;
	private String partner_order_id;
	private String partner_user_id;
	private String pg_token;

}
