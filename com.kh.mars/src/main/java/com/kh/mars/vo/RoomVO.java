package com.kh.mars.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class RoomVO {
	private int memberNo;
	private int roomNo;
	private Date roomEnterTime;
	private int roomEnterIs;
	private String memberNick;
	private int attachNo;
	private int dmNo;
	private String dmContent;
	private int dmType;
	private Date dmRecordTime;
	private int dmRecordCheck;
	private int target;
	private int unreadcount;
}
