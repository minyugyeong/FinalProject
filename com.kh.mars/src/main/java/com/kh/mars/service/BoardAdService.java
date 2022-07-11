package com.kh.mars.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.mars.entity.BoardAdDto;

public interface BoardAdService {
	
	void insert(BoardAdDto boardAdDto, List<MultipartFile> boardAdAttach) throws IllegalStateException, IOException;
	
	void delete(int boardAdNo);

}
