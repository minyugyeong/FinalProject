package com.kh.mars.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class BoardAttachVO {
	private int attachNo;
	private int boardNo;
	private String attachUploadname;
	private String attachType;
	private int attachSize;
}
