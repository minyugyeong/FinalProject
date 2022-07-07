package com.kh.mars.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.FollowDto;
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

	@Override
	public boolean follow(int followWho, int memberNo, int followConfirm) {
		Map<Object, Object> param = new HashMap<Object, Object>();
		param.put("followWho", followWho);
		param.put("memberNo", memberNo);
		param.put("followConfirm", followConfirm);
		return sqlSession.update("follow.follow",param)>0;
	}

	@Override
	public boolean followDelete(int followWho, int memberNo) {
		Map<Object, Object> param = new HashMap<Object, Object>();
		param.put("followWho", followWho);
		param.put("memberNo", memberNo);
		return sqlSession.delete("follow.followDelete",param)>0;
	}

	@Override
	public FollowDto selectOne(int followWho, int memberNo) {
		Map<Object, Object> param = new HashMap<Object, Object>();
		param.put("followWho", followWho);
		param.put("memberNo", memberNo);
		
		FollowDto followDto = sqlSession.selectOne("follow.one", param);
		
		return followDto;
	}

	@Override
	public boolean isFollower(int followWho, int memberNo) {
		Map<Object, Object> param = new HashMap<Object, Object>();
		param.put("followWho", followWho);
		param.put("memberNo", memberNo);
		param.put("followConfirm", 1);
		
		FollowDto followDto = sqlSession.selectOne("follow.isFollower", param);
		
		if(followDto == null) {
			return false;
		}
		else {
			return true;
		}
	}

	@Override
	public boolean blockFollowCheck(int followWho, int memberNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("followWho", followWho);
		param.put("memberNo", memberNo);
		
		FollowDto followDto = sqlSession.selectOne("follow.blockFollowCheck", param);
		
		if(followDto == null) {
			return false;
		}
		else {
			return true;
		}
	}

	@Override
	public boolean blockFollowingCheck(int followWho, int memberNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("followWho", followWho);
		param.put("memberNo", memberNo);
		
		FollowDto followDto = sqlSession.selectOne("follow.blockFollowingCheck", param);
		
		if(followDto == null) {
			return false;
		}
		else {
			return true;
		}
	}

	@Override
	public int followingDelete(int followWho, int memberNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("followWho", followWho);
		param.put("memberNo", memberNo);
		
		return sqlSession.delete("follow.followDelete", param);
	}

}
