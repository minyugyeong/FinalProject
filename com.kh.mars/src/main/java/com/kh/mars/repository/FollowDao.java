package com.kh.mars.repository;

import java.util.List;

import com.kh.mars.entity.MemberDto;
import com.kh.mars.vo.FollowRecommendVO;

public interface FollowDao {

	List<FollowRecommendVO> recommendList(int memberNo);
}
