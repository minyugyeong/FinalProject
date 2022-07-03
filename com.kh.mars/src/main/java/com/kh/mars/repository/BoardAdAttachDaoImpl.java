package com.kh.mars.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.BoardAdAttachDto;

@Repository
public class BoardAdAttachDaoImpl implements BoardAdAttachDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(BoardAdAttachDto boardAdAttachDto) {
		int sequence = sqlSession.selectOne("board-ad-attach.sequence");
		boardAdAttachDto.setBoardAdAttachNo(sequence);
		
		sqlSession.insert("board-ad-attach.insert", boardAdAttachDto);
		
	}

}
