package com.kh.mars.repository;

import com.kh.mars.entity.BoardLikeDto;

public interface BoardLikeDao {
	
	BoardLikeDto selectOne(int memberNo, int boardNo);
	boolean boardLike(int memberNo, int boardNo);
	boolean boardLikeCancel(int memberNo, int boardNo);
}
