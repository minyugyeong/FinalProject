package com.kh.mars.repository;

import java.util.List;

import com.kh.mars.entity.BoardMemberTagDto;

public interface BoardMemberTagDao {

	void insert(BoardMemberTagDto boardMemberTagDto);

	boolean delete(int boardNo);
	
	List<String> selectList(int boardNo);

}
