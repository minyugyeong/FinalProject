package com.kh.mars.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardAttachDaoImpl implements BoardAttachDao {
	
	@Autowired
	private SqlSession sqlSession;

}
