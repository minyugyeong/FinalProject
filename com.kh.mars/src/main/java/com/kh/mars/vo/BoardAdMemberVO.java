package com.kh.mars.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class BoardAdMemberVO {
	
	private int boardAdNo;
	private int memberNo;
	private Date boardAdDate;
	private String boardAdContent;
	private int boardAdIsReply;
	private String memberEmail;
	private String memberPassword;
	private int memberGender;
	private String memberNick;
	private String memberPhone;
	private String memberGrade;
	private int memberPrivate;
	private String memberInterest;
	private String memberHighschool;
	private String memberUniversity;
	private int attachNo;

}
