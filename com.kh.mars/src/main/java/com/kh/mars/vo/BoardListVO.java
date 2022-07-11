package com.kh.mars.vo;

import java.sql.Date;

import com.kh.mars.entity.BoardDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class BoardListVO {
	private int boardNo;
	private int memberNo;
	private Date boardDate;
	private String boardContent;
	private int boardIsReply;
	private int likecount;
	private String memberNick;
	private int writerProfile;
	private int replycount;
	private int isLike;
	private String boardAdLink;
}
