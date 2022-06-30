package com.kh.mars.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class FollowRecommendVO {
	private int followTarget;
	private String targetNick;
	private int followcount;
	private String whoNick;
	private int targetAttach;
}
