package com.kh.mars.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class FollowVO {
	private int memberNo;
	private String memberNick;
	private int attachNo;
	private Integer followConfirm;
}
