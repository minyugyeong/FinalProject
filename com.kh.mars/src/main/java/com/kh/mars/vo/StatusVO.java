package com.kh.mars.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class StatusVO {

	//성별 관심 유형
	private String memberInterest;
	private int countGenderAll;
	private int countGenderMan;
	private int countGenderWoman;
	
	//광고 유형별 매출액
	private int sumArt;
	private int sumSport;
	private int sumTravel;
	private int sumBeauty;
	private int sumFashion;
	private int sumCook;
	private int sumNull;
	
	//유형별 광고 개수
	private int countAd;
	
	//연도별 매출액(where 광고 진행, 광고 마감)
	private int year;
	private int sumPrice;
	
	//월별 매출액(where 광고 진행, 광고 마감, 연도)
	private int month;
	
}
