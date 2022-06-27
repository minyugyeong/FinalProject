package com.kh.mars.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class BoardAdDto {

	private int boardAdNo;
	private int memberNo;
	private int adNo;
	private Date boardAdDate;
	private String boardAdContent;
	private String boardAdLink;
	private int boardAdCount;
}
