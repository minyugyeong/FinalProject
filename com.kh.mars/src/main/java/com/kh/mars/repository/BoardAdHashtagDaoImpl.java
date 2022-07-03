package com.kh.mars.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.BoardAdHashtagDto;

@Repository
public class BoardAdHashtagDaoImpl implements BoardAdHashtagDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(BoardAdHashtagDto boardAdHashtagDto) {
		
		sqlSession.insert("board_ad_hashtag.insert", boardAdHashtagDto);
		
	}

}
