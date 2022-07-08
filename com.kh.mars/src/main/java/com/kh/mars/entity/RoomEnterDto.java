package com.kh.mars.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class RoomEnterDto {
	private int memberNo;
	private int roomNo;
	private Date roomEnterTime;
	private int roomEnterIs;
	
}
