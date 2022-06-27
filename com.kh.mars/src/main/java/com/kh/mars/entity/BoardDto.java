package com.kh.mars.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class BoardDto {
	private int boardNo;
	private int memberNo;
	private Date boardDate;
	private String boardContent;
	private int boardIsReply;
}
