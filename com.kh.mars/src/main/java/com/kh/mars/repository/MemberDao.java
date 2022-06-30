package com.kh.mars.repository;

import com.kh.mars.entity.MemberDto;

public interface MemberDao {

	void join(MemberDto memberDto);

	MemberDto login(String memberEmail, String memberPassword);

	MemberDto info(int memberNo);

	boolean edit(MemberDto memberDto);

	boolean changePassword(int memberNo, String currentPassword, String changePassword);


}
