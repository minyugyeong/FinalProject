package com.kh.mars.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.BoardAttachDto;

@Repository
public class BoardAttachDaoImpl implements BoardAttachDao {
	
	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public void insert(BoardAttachDto boardAttachDto) {
		int sequence = sqlSession.selectOne("board_attach.sequence");
		boardAttachDto.setBoardAttachNo(sequence);
		
		sqlSession.insert("board_attach.insert", boardAttachDto);
		
	}


	@Override
	public void delete(int boardNo) {

		sqlSession.delete("board_attach.delete", boardNo);
		
	}


}
