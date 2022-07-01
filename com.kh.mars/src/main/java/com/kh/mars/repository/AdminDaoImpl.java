package com.kh.mars.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.mars.entity.MemberDto;

public class AdminDaoImpl implements AdminDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MemberDto> list() {
		return sqlSession.selectList("admin.list");
	}
	
}
