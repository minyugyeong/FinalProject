package com.kh.mars.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MemberDto {
	private int memberNo;
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
	private String memberName;
	private String memberIntroduce;
}
