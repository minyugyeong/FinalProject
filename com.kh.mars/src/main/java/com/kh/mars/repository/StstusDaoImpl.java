package com.kh.mars.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.vo.AdStatusVO;
import com.kh.mars.vo.JoinGenderVO;
import com.kh.mars.vo.MemberInterestVO;
@Repository
public class StstusDaoImpl implements StatusDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<JoinGenderVO> joinGender() {
		return sqlSession.selectList("status.joinGender");
	}

	@Override
	public List<MemberInterestVO> memberInterest() {
		return sqlSession.selectList("status.memberInterest");
	}

	@Override
	public List<MemberInterestVO> manInterest() {
		return sqlSession.selectList("status.manInterest");
	}

	@Override
	public List<MemberInterestVO> womenInterest() {
		return sqlSession.selectList("status.womanInterest");
	}

	@Override
	public List<AdStatusVO> interestAd() {
		return sqlSession.selectList("status.interestAd");
	}

	@Override
	public List<AdStatusVO> adSum() {
		return sqlSession.selectList("status.adSum");
	}

}
