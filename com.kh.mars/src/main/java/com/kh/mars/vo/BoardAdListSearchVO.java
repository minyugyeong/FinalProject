package com.kh.mars.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BoardAdListSearchVO {
	
	private String memberEmail;
	private String memberInterest;
	private Integer minCount, maxCount;
	private Integer minPrice, maxPrice;
	private String beginDate, endDate;
	private String boardAdCheck;
	
}
