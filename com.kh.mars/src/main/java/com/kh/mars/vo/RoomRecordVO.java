package com.kh.mars.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class RoomRecordVO {
	private int dmNo;
	private int who;
	private int target;
	private Date dmRecordTime;
	private int dmRecordCheck;
	private int roomNo;
	private String dmContent;
	private int dmType;
}
