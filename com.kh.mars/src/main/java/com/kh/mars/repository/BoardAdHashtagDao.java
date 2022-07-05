package com.kh.mars.repository;

import java.util.List;

import com.kh.mars.entity.BoardAdHashtagDto;

public interface BoardAdHashtagDao {

	void insert(BoardAdHashtagDto boardAdHashtagDto);

	List<String> selectList(int boardAdNo);

	void delete(int boardAdNo);
}
