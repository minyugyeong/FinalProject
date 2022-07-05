package com.kh.mars.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class BoardMemberVO {
	
	private int boardNo;
	private int memberNo;
	private Date boardDate;
	private String boardContent;
	private int boardIsReply;
	private int memberNo1;
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
	private int memberNo2;
	private int attachNo;

}
