package com.kh.mars.repository;

import java.util.List;

import com.kh.mars.entity.BoardAdLikeDto;
import com.kh.mars.entity.BoardLikeDto;
import com.kh.mars.vo.BoardLikeListVO;

public interface BoardAdLikeDao {
	
	BoardAdLikeDto selectOne(int memberNo, int boardNo);
	boolean boardAdLike(int memberNo, int boardNo);
	boolean boardAdLikeCancel(int memberNo, int boardNo);
	List<BoardLikeListVO> boardAdLikeList(int memberNo, int boardNo);
}
