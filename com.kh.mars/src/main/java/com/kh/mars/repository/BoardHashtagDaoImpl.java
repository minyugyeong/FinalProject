package com.kh.mars.repository;

import java.util.List;

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

	@Override
	public boolean delete(int boardNo) {
		
		int count = sqlSession.delete("board-hashtag.delete", boardNo);
		
		return count > 0;
	}

	@Override
	public List<String> selectList(int boardNo) {
		
		return sqlSession.selectList("board-hashtag.selectHash", boardNo);
	}
	

}






