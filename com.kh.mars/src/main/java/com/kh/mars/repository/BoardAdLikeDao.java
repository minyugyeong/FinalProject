package com.kh.mars.repository;

import com.kh.mars.entity.BoardAdLikeDto;
import com.kh.mars.entity.BoardLikeDto;

public interface BoardAdLikeDao {
	
	BoardAdLikeDto selectOne(int memberNo, int boardNo);
	boolean boardAdLike(int memberNo, int boardNo);
	boolean boardAdLikeCancel(int memberNo, int boardNo);
}
