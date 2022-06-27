package com.kh.mars.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AttachDaoImpl implements AttachDao {
	
	@Autowired
	private SqlSession sqlSession;

}
