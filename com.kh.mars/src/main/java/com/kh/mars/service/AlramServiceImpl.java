package com.kh.mars.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mars.vo.AlramVO;

@Repository
public class AlramServiceImpl implements AlramService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AlramVO> selectAlram(int memberNo) {
		return sqlSession.selectList("alram.selectList", memberNo);
	}

	@Transactional
	@Override
	public void check(int memberNo) {
		sqlSession.update("alram.checkBL", memberNo);
		sqlSession.update("alram.checkAL", memberNo);
		sqlSession.update("alram.checkFollow", memberNo);
		sqlSession.update("alram.checkBR", memberNo);
		sqlSession.update("alram.checkAR", memberNo);
	}

	@Override
	public int isRocket(int memberNo) {
		return sqlSession.selectOne("alram.isAlram",memberNo);
	}

	@Override
	public int iscCat(int memberNo) {
		return sqlSession.selectOne("alram.isChatAlram",memberNo);
	}
	
	

}
