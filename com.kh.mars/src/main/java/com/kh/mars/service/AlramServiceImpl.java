package com.kh.mars.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.vo.AlramVO;

@Repository
public class AlramServiceImpl implements AlramService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AlramVO> selectAlram(int memberNo) {
		return sqlSession.selectList("alram.selectList", memberNo);
	}
	
	

}
