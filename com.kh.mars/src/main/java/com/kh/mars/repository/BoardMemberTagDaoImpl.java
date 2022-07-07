package com.kh.mars.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.BoardMemberTagDto;

@Repository
public class BoardMemberTagDaoImpl implements BoardMemberTagDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(BoardMemberTagDto boardMemberTagDto) {
		
		sqlSession.insert("board_member_tag.insert", boardMemberTagDto);
		
	}

	@Override
	public boolean delete(int boardNo) {
		
		int count = sqlSession.delete("board_member_tag.delete", boardNo);
		
		return count > 0;
	}

	@Override
	public List<String> selectList(int boardNo) {
		
		return sqlSession.selectList("board_member_tag.selectMemberTag", boardNo);
	}
	
	

}
