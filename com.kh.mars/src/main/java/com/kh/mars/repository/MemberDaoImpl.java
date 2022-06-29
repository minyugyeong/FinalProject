package com.kh.mars.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public void join(MemberDto memberDto) {
		int memberNo = sqlSession.selectOne("member.sequence");
		memberDto.setMemberNo(memberNo);
		
		String rawPassword = memberDto.getMemberPassword();
		String encryptPassword = passwordEncoder.encode(rawPassword);
		memberDto.setMemberPassword(encryptPassword);
		
		sqlSession.insert("member.join", memberDto);
	}

	@Override
	public MemberDto login(String memberEmail, String memberPassword) {
		MemberDto memberDto = sqlSession.selectOne("member.one", memberEmail);
		if(memberDto == null) {
			return null;
		}
		
//		boolean isPassword = memberDto.getMemberPassword().equals(memberPassword);
		boolean isPassword = passwordEncoder.matches(memberPassword, memberDto.getMemberPassword());
		if(isPassword) {
			return memberDto;
		}
		else {
			return null;
		}
	}

	@Override
	public MemberDto info(int memberNo) {
		return sqlSession.selectOne("member.info", memberNo);
	}

}
