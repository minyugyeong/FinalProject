package com.kh.mars.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.MemberDto;
import com.kh.mars.vo.FollowRecommendVO;
import com.kh.mars.vo.FollowVO;
import com.kh.mars.vo.FollowerVO;

@Repository
public class FollowDaoImpl implements FollowDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<FollowRecommendVO> recommendList(int memberNo) {
		List<FollowRecommendVO> list = sqlSession.selectList("follow.recommend", memberNo);
		return list;
	}

	@Override
	public int countFollow(int memberNo) {
		return sqlSession.selectOne("follow.followCount",memberNo);
	}

	@Override
	public int countFollower(int memberNo) {
		return sqlSession.selectOne("follow.followerCount", memberNo);
	}

	@Override
	public List<FollowVO> followList(int memberNo) {
		return sqlSession.selectList("follow.followList",memberNo);
	}

	@Override
	public List<FollowerVO> followerList(int memberNo) {
		return sqlSession.selectList("follow.followerList",memberNo);
	}

	
	
	
}
