package com.kh.mars.repository;

import com.kh.mars.entity.BoardAttachDto;

public interface BoardAttachDao {
	
	void insert(BoardAttachDto boardAttachDto);

	void delete(int boardNo);

}
