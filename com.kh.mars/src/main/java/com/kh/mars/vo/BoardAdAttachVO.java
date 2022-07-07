package com.kh.mars.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BoardAdAttachVO {
	private int attachNo;
	private int boardAdNo;
	private String attachUploadname;
	private String attachType;
	private int attachSize;
	
	

}
