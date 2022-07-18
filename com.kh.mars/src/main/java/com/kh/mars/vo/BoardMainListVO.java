package com.kh.mars.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class BoardMainListVO {
	private BoardListVO boardListVO;
	private List<BoardAttachVO> attachList;
	private List<BoardHashTagVO> hashtagList;
	
}
