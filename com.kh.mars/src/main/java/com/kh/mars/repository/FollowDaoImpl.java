package com.kh.mars.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.MemberDto;
import com.kh.mars.vo.FollowRecommendVO;

@Repository
public class FollowDaoImpl implements FollowDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<FollowRecommendVO> recommendList(int memberNo) {
		List<FollowRecommendVO> list = sqlSession.selectList("follow.recommend", memberNo);
		return list;
	}

	
}
