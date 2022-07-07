package com.kh.mars.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class BoardReplyVO {

	private int replyNo;
	private String replyContent;
	private int superNo;
	private Date replyDate;
	private int replyCheck;
	private int replyMemberNo;
	private int reReplycount;
	private int replyMemberProfile;
	private String memberNick;
	
	
}
