package com.kh.mars.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class AdDto {
	private int adNo;
	private int adCount;
	private int adPrice;
}
