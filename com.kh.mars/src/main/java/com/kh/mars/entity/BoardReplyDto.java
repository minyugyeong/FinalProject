package com.kh.mars.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@NoArgsConstructor@AllArgsConstructor@Builder
public class BoardReplyDto {

	private int replyNo;
	private int boardNo;
}
