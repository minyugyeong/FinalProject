package com.kh.mars.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ReplyDto {
	private int replyNo;
	private String replyContent;
	private int superNo;
	private Date replyDate;
	private int replyCheck;
	private int replyMemberNo;
}
