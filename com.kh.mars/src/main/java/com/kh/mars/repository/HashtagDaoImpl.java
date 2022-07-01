package com.kh.mars.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.HashtagDto;

@Repository
public class HashtagDaoImpl implements HashtagDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(HashtagDto hashtagDto) {
		
		int hashtagNo = sqlSession.selectOne("hashtag.sequence");
		hashtagDto.setHashtagNo(hashtagNo);
		
		sqlSession.insert("hashtag.insert", hashtagDto);
		
	}

	@Override
	public HashtagDto selectOne(String hashtagName) {
		
		return sqlSession.selectOne("hashtag.one", hashtagName); 
	}
	
	

}
