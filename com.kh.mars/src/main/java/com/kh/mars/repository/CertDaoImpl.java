package com.kh.mars.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.CertDto;

@Repository
public class CertDaoImpl implements CertDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(CertDto certDto) {
		CertDto findDto = sqlSession.selectOne("cert.one", certDto.getMemberEmail());
		if(findDto == null) {
			sqlSession.insert("cert.insert", certDto);
		}
		else {
			sqlSession.update("cert.edit", certDto);
		}
	}

	@Override
	public boolean check(CertDto certDto) {
		int count = sqlSession.selectOne("cert.check", certDto);
		if(count > 0) {
			sqlSession.delete("cert.delete", certDto.getMemberEmail());
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public void clear() {
		sqlSession.delete("cert.clear");
		
	}

}
