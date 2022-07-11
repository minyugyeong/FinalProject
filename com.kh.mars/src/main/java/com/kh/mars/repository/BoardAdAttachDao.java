package com.kh.mars.repository;

import com.kh.mars.entity.BoardAdAttachDto;

public interface BoardAdAttachDao {
	
	void insert(BoardAdAttachDto boardAdAttachDto);

	void delete(int boardAdNo);



}
