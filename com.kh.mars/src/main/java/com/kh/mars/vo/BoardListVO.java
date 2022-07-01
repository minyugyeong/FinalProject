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
	private int followTarget;
	private String memberNick;
	private int replyNo;
	private String replyContent;
	private int replyMemberNo;
	private String replyNick;
	private int writerProfile;
	private int isLike;
}
