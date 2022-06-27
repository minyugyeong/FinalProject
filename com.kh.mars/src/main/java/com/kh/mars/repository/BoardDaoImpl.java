package com.kh.mars.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	private SqlSession sqlSession;


	@Override
	public BoardDto insert(BoardDto boardDto) {
		int boardNo = sqlSession.selectOne("board.sequence", boardDto);
		boardDto.setBoardNo(boardNo);
		sqlSession.insert("board.insert", boardDto);
		return sqlSession.selectOne("board.selectOne", boardNo);
	}
	
}
