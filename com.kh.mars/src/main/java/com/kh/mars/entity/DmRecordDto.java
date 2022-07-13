package com.kh.mars.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class DmRecordDto {
	private int dmNo;
	private int who;
	private int target;
	private Date dmRecordTime;
	private int dmRecordCheck;
	private int roomNo;
}
