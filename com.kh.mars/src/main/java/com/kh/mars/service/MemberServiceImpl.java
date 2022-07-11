package com.kh.mars.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mars.repository.FollowDao;
import com.kh.mars.repository.MemberDao;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private FollowDao followDao;
	

	@Override
	@Transactional
	public void professional(int memberNo, String memberInterest) {
		
		//비즈니스 계정 단계
		// 관심사 선택 -> 계정 전체 공개 + 팔로우 요청 전체 승인 -> 비즈니스 계정으로 변경
		memberDao.changeInterest(memberNo, memberInterest);
		
		// 팔로우 요청 전체 승인
		followDao.open(memberNo);
		
		
	}

}
