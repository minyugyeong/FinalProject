package com.kh.mars.repository;

import java.util.List;

import com.kh.mars.entity.BoardLikeDto;
import com.kh.mars.vo.BoardLikeListVO;

public interface BoardLikeDao {
	
	BoardLikeDto selectOne(int memberNo, int boardNo);
	boolean boardLike(int memberNo, int boardNo);
	boolean boardLikeCancel(int memberNo, int boardNo);
	List<BoardLikeListVO> boardLikeList(int memberNo, int boardNo);
}
