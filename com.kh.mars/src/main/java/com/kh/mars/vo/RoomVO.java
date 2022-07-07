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
	private int roomEnterIs;
	private int dmNo;
	
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date dmRecordTime;
	
	private int target;
	private String dmContent;
	private String memberNick;
	
}
