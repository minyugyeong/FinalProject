package com.kh.mars.repository;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.mars.entity.MemberDto;
import com.kh.mars.vo.MemberSearchVO;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private AttachDao attachDao;
	
	@Autowired
	private MemberProfileDao memberProfileDao;

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

	//멤버 정보 조회 (비밀번호 정보 제외)
	@Override
	public MemberDto myInfo(int memberNo) {
		return sqlSession.selectOne("member.myInfo", memberNo);
	}
	
	//멤버 프로필사진 조회
	public int memberProfile(int memberNo) {
		if(sqlSession.selectOne("member.myProfile", memberNo) == null) return 0;
		int attachNo = sqlSession.selectOne("member.myProfile", memberNo);
		return attachNo;
	}
	@Override
	public MemberDto info(int memberNo) {
		return sqlSession.selectOne("member.info", memberNo);
	}

	@Override
	public boolean edit(MemberDto memberDto) {
		return sqlSession.update("member.edit", memberDto) >0;
	}

	@Override
	public boolean changePassword(int memberNo, String currentPassword, String changePassword) {
		MemberDto memberDto = this.info(memberNo);
		boolean isPasswordMatch = passwordEncoder.matches(currentPassword, memberDto.getMemberPassword());
		if(isPasswordMatch) {
			
			String encodePassword = passwordEncoder.encode(changePassword);
			int count = sqlSession.update("member.changePassword", MemberDto.builder().memberNo(memberNo).memberPassword(encodePassword).build());
			return count >0;
		}else {
			return false;
		}
		
			
		
		
	}

	@Override
	public void proFile(MultipartFile memberProfile, int memberNo) throws IllegalStateException, IOException {
		int attachNo = attachDao.save(memberProfile);
		memberProfileDao.insert(memberNo,attachNo);
		
	}
	
	@Override
	public String nick(int memberNo) {
		
		return sqlSession.selectOne("member.nick", memberNo);
	}

	@Override
	public int selectNo(String memberNick) {
		
		return sqlSession.selectOne("member.selectNo", memberNick);
	}

	//멤버 리스트
	@Override
	public List<MemberDto> selectList(MemberSearchVO vo, int p, int s) {
		
		Map<String, Object> param = new HashMap<>();
		param.put("vo", vo);
		
		int end = p * s;
		int begin = end - (s-1);
		param.put("end", end);
		param.put("begin", begin);
		
		return sqlSession.selectList("member.searchList", param);
	}
	
	@Override
	public int count(MemberSearchVO vo) {
		
		return sqlSession.selectOne("member.count", vo);
	}

	
	@Override
	public String checkEmail(String memberEmail) {
		return sqlSession.selectOne("member.checkEmail",memberEmail);
		
	}

	@Override
	public boolean resetPassword(MemberDto memberDto) {
		String rawPassword = memberDto.getMemberPassword();
		String encryptPassword = passwordEncoder.encode(rawPassword);
		memberDto.setMemberPassword(encryptPassword);
		int count = sqlSession.update("member.resetPassword", memberDto);
		return count > 0;
	}


	@Override
	public String checkNick(String memberNick) {
		return sqlSession.selectOne("member.checkNick",memberNick);
	}

	@Override
	public boolean changeInterest(int memberNo, String memberInterest) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", memberNo);
		param.put("memberInterest", memberInterest);
		
		int count = sqlSession.update("member.changeInterest", param);
		
		return count > 0;
	}

	@Override
	public void personal(int memberNo) {
		sqlSession.update("member.personal",memberNo);
	}

	@Override
	public boolean exit(int memberNo, String memberPassword) {
		
		MemberDto memberDto = this.info(memberNo);
		
		if(memberDto != null) {//존재하는회원
			
				boolean isPasswordMatch = passwordEncoder.matches(memberPassword, memberDto.getMemberPassword());
				
				if(isPasswordMatch) {
					int count = sqlSession.delete("member.exit", memberNo);
					return count > 0 ;
				}
				else {
					return false;
				}
				
			}
		else {
			return false;
		}
		}

	@Override
	public String checkPhone(String memberPhone) {
		return sqlSession.selectOne("member.checkPhone", memberPhone);
	}


}











