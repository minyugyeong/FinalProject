package com.kh.mars.repository;

import java.util.List;

import com.kh.mars.entity.BoardAdAttachDto;

public interface BoardAdAttachDao {
	
	void insert(BoardAdAttachDto boardAdAttachDto);

	void delete(int boardAdNo);

	List<BoardAdAttachDto> selectList(int boardAdNo);

}
