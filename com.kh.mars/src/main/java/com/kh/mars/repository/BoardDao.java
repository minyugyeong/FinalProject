package com.kh.mars.repository;

import java.util.List;

import com.kh.mars.entity.BoardDto;
import com.kh.mars.vo.BoardDetailVO;
import com.kh.mars.vo.BoardListVO;
import com.kh.mars.vo.BoardMainListVO;
import com.kh.mars.vo.BoardReplyVO;

public interface BoardDao {

	BoardDto insert(BoardDto boardDto);

	List<BoardMainListVO> mainList(int memberNo, int pageCount, int uptoNo);

	int countBoard(int memberNo);
	
	List<BoardReplyVO> detailReply(int memberNo, int boardNo);

	

}
