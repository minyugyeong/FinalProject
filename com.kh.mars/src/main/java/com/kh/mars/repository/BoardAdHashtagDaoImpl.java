package com.kh.mars.repository;

import java.util.List;

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

	@Override
	public List<String> selectList(int boardAdNo) {
		
		return sqlSession.selectList("board_ad_hashtag.selectHash", boardAdNo);
	}

	@Override
	public void delete(int boardAdNo) {
		sqlSession.delete("board_ad_hashtag.delete", boardAdNo);
		
	}

}
