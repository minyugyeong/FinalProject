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

	@Override
	public AdDto insert(AdDto adDto) {
		int adNo = sqlSession.selectOne("ad.sequence");
		adDto.setAdNo(adNo);
		sqlSession.insert("ad.insert", adDto);
		
		return adDto;
	}

	@Override
	public AdDto update(AdDto adDto) {
		sqlSession.update("ad.edit", adDto);
		
		return sqlSession.selectOne("ad.one", adDto.getAdNo());
	}

	@Override
	public void delete(int adNo) {
		sqlSession.delete("ad.delete", adNo);
		
	}

	@Override
	public List<AdDto> selectListOrderbyNo() {
		
		return sqlSession.selectList("ad.selectListOrderbyNo");
	}
	
	
	

}
