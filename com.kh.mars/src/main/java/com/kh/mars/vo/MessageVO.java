package com.kh.mars.vo;

import java.util.Date;

import com.kh.mars.entity.MemberDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class MessageVO {
	private int dmNo;
	private int who;
	private String dmContent;
	private int roomNo;
	private Date dmRecordTime;
}
