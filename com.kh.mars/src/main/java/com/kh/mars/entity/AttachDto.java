package com.kh.mars.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class AttachDto {
	private int attachNo;
	private String attachUploadname;
	private String attachType;
	private long attachSize;
}
