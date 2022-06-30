package com.kh.mars.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ReceiveVO {
	
	private int type;
	private String roomNo;
	private String message;
}