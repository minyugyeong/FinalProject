package com.kh.mars.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void join(MemberDto memberDto) {
		int memberNo = sqlSession.selectOne("member.sequence");
		memberDto.setMemberNo(memberNo);
		sqlSession.insert("member.join", memberDto);
	}

	@Override
	public MemberDto login(String memberEmail, String memberPassword) {
		MemberDto memberDto = sqlSession.selectOne("member.one", memberEmail);
		if(memberDto == null) {
			return null;
		}
		
		boolean isPassword = memberDto.getMemberPassword().equals(memberPassword);
		if(isPassword) {
			return memberDto;
		}
		else {
			return null;
		}
	}

}
