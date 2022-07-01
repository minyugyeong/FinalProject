package com.kh.mars.vo;

import java.util.Date;

import com.kh.mars.entity.MemberDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class MessageVO {
	private int memberNo;
	private String memberNick;
	private String text;
	private Date time;
}
