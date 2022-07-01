package com.kh.mars.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberProfileDaoImpl implements MemberProfileDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(int memberNo, int attachNo) {
		Map<Object,Object> param = new HashMap<>();
		param.put("memberNo", memberNo);
		param.put("attachNo", attachNo);
		sqlSession.insert("memberProfile.insert", param);
	}

	@Override
	public int info(int memberNo) {
		Integer attachNo = sqlSession.selectOne("memberProfile.one", memberNo);
		if(attachNo == null) {
			return 0;
		}
		else {
			return attachNo;
		}
	}
	
	@Override
	public Integer selectAttachNo(Integer memberNo) {
		
		return sqlSession.selectOne("member-profile.selectAttachNo", memberNo);
	}

}
