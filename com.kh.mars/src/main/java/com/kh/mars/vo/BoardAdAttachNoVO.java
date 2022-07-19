package com.kh.mars.vo;

import java.sql.Date;
import java.util.List;

import com.kh.mars.entity.BoardAdAttachDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BoardAdAttachNoVO {
	
	private int boardAdNo;
	private int memberNo;
	private int adNo;
	private Date boardAdDate;
	private String boardAdContent;
	private String boardAdLink;
	private int boardAdCount;
	private String boardAdCheck;
	private int boardAdIsReply;
	private int boardAdPrice;
	private List<BoardAdAttachDto> attachNoList;
	private int rn2;

}
