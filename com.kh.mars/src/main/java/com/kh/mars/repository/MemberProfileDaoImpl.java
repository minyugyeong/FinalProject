package com.kh.mars.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberProfileDaoImpl implements MemberProfileDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public Integer selectAttachNo(Integer memberNo) {
		
		return sqlSession.selectOne("member-profile.selectAttachNo", memberNo);
	}

}
