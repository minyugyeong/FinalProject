package com.kh.mars.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class SearchVO {
	private int no;
	private String main;
	private String sub;
	private int type;
	private int isFollow;
	private int attachNo;
}
