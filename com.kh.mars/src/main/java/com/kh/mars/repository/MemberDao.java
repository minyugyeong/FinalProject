package com.kh.mars.repository;

import com.kh.mars.entity.MemberDto;

public interface MemberDao {

	void join(MemberDto memberDto);

	MemberDto login(String memberEmail, String memberPassword);
	
	//멤버 정보조회(비밀번호제외)
	MemberDto myInfo(int memberNo);
	//프로필 사진조회
	int memberProfile(int memberNo);

	MemberDto info(int memberNo);
	
	String nick(int memberNo);


}
