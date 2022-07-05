package com.kh.mars.repository;

import java.util.List;

import com.kh.mars.entity.BoardHashtagDto;

public interface BoardHashtagDao {
	
	void insert(BoardHashtagDto boardHashtagDto);

	boolean delete(int boardNo);

	List<String> selectList(int boardNo);

	
	

}
