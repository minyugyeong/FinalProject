package com.kh.mars.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class RecommendListVO {
	private int memberNo;
	private String memberNick;
	private String memberName;
	private int attachNo;
}
