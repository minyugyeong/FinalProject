package com.kh.mars.repository;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.mars.entity.MemberDto;
import com.kh.mars.vo.MemberSearchVO;
import com.kh.mars.vo.MemberVO;

public interface MemberDao {

	void join(MemberDto memberDto);

	MemberDto login(String memberEmail, String memberPassword);
	
	//멤버 정보조회(비밀번호제외)
	MemberDto myInfo(int memberNo);
	//프로필 사진조회
	int memberProfile(int memberNo);

	MemberDto info(int memberNo);
	
	String nick(int memberNo);

	boolean edit(MemberDto memberDto);

	boolean changePassword(int memberNo, String currentPassword, String changePassword);

	void proFile(MultipartFile memberProfile, int memberNo) throws IllegalStateException, IOException;

	String checkEmail(String memberEmail);

	boolean resetPassword(MemberDto memberDto);

	int selectNo(String memberNick);

	int count(MemberSearchVO vo);

	List<MemberDto> selectList(MemberSearchVO vo, int p, int s);

	String checkNick(String memberNick);

	boolean changeInterest(int memberNo, String memberInterest);

	void personal(int memberNo);

	MemberVO dmMemberInfo(int targetNo);
	boolean exit(int memberNo, String memberPassword);

	String checkPhone(String memberPhone);



}
