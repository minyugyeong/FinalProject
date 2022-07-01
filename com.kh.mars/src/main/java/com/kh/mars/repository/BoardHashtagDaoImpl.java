package com.kh.mars.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.BoardHashtagDto;

@Repository
public class BoardHashtagDaoImpl implements BoardHashtagDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(BoardHashtagDto boardHashtagDto) {
		
		sqlSession.insert("board-hashtag.insert", boardHashtagDto);
		
	}
	
	

}
