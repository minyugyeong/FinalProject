package com.kh.mars.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.BoardAdLikeDto;
import com.kh.mars.entity.BoardLikeDto;
import com.kh.mars.repository.BoardAdLikeDao;
import com.kh.mars.repository.BoardLikeDao;

@Repository
public class BoardLikeServiceImpl implements BoardLikeService {

	@Autowired
	private BoardLikeDao boardLikeDao;

	@Autowired
	private BoardAdLikeDao boardAdLikeDao;
	
	@Override
	public int boardLike(int memberNo, int boardNo) {
		
		BoardLikeDto boardLikeDto = boardLikeDao.selectOne(memberNo, boardNo);
		
		if(boardLikeDto == null) {
			boardLikeDao.boardLike(memberNo, boardNo);
			return memberNo;
		}else {
			boardLikeDao.boardLikeCancel(memberNo, boardNo);
			return 0;
		}
	}

	@Override
	public int boardAdLike(int memberNo, int boardNo) {
		BoardAdLikeDto boardAdLikeDto = boardAdLikeDao.selectOne(memberNo, boardNo);
		
		if(boardAdLikeDto == null) {
			boardAdLikeDao.boardAdLike(memberNo, boardNo);
			return memberNo;
		}else {
			boardAdLikeDao.boardAdLikeCancel(memberNo, boardNo);
			return 0;
		}
	}
	
	
}
