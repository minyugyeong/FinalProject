package com.kh.mars.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.kh.mars.entity.BoardDto;

public interface BoardService {
	
	void insert(BoardDto boardDto, MultipartFile boardAttach) throws IllegalStateException, IOException;

}
