package com.kh.mars.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class SearchListVO {
	private int boardNo;
	private int attachNo;
	private int attachCount;
	private int type;
}
