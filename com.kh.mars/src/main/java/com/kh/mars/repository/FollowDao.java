package com.kh.mars.repository;

import java.util.List;

import com.kh.mars.entity.MemberDto;
import com.kh.mars.vo.FollowRecommendVO;
import com.kh.mars.vo.FollowVO;
import com.kh.mars.vo.FollowerVO;

public interface FollowDao {

	List<FollowRecommendVO> recommendList(int memberNo);

	int countFollow(int memberNo);

	int countFollower(int memberNo);

	List<FollowVO> followList(int memberNo);

	List<FollowerVO> followerList(int memberNo);



}
