package com.kh.mars.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.AdDto;

@Repository
public class AdDaoImpl implements AdDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AdDto> selectList() {
		
		return sqlSession.selectList("ad.selectList");
	}
	
	

}
