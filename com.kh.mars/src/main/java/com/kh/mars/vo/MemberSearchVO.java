package com.kh.mars.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MemberSearchVO {
	
	private String memberEmail;
	private String memberGender;
	private String memberNick;
	private String memberPhone;
	private String memberGrade;
	private String memberInterest;
	private String memberName;
	

}
