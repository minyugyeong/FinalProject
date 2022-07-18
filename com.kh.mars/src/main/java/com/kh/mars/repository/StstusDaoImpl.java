package com.kh.mars.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.vo.JoinGenderVO;
import com.kh.mars.vo.StatusVO;
@Repository
public class StstusDaoImpl implements StatusDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<JoinGenderVO> joinGender() {
		return sqlSession.selectList("status.joinGender");
	}

	@Override
	public List<StatusVO> memberInterest() {
		return sqlSession.selectList("status.memberInterest");
	}

	@Override
	public List<StatusVO> manInterest() {
		return sqlSession.selectList("status.manInterest");
	}

	@Override
	public List<StatusVO> womenInterest() {
		return sqlSession.selectList("status.womanInterest");
	}

	@Override
	public List<StatusVO> interestAd() {
		return sqlSession.selectList("status.interestAd");
	}

	@Override
	public List<StatusVO> adSum() {
		return sqlSession.selectList("status.adSum");
	}

	@Override
	public List<StatusVO> yearSales() {
		return sqlSession.selectList("status.yearSales");
	}

	@Override
	public List<StatusVO> monthSales(int year) {
		
		return sqlSession.selectList("status.monthSales", year);
	}



}
