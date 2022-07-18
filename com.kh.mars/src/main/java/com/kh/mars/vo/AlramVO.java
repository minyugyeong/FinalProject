package com.kh.mars.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class AlramVO {

	private int boardNo;
	private int memberNo;
	private String memberNick;
	private int attachNo;
	private int check;
	private Date alramTime;
	private int type;
	private int etc;
}
