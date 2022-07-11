package com.kh.mars.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class AmountVO {
	
	private int total;
	private int tax_free;
	private int vat;
	private int point;
	private int discount;

}
