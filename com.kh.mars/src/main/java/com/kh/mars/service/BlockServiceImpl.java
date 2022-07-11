package com.kh.mars.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mars.entity.BlockDto;
import com.kh.mars.repository.BlockDao;
import com.kh.mars.repository.FollowDao;

@Service
public class BlockServiceImpl implements BlockService{
	
	@Autowired
	private FollowDao followDao;
	
	@Autowired
	private BlockDao blockDao;

	@Transactional
	@Override
	public void block(int memberNo, int followWho) {
		//팔로우 상태인지 검사
		boolean isFollow = followDao.blockFollowCheck(followWho, memberNo);
		
		//팔로우 상태면 삭제
		if(isFollow == true) {
			followDao.followDelete(followWho, memberNo);
		}
		
		//팔로잉 상태인지 검사
		boolean isFollowing = followDao.blockFollowingCheck(followWho, memberNo);
		
		//팔로잉 상태면 삭제
		if(isFollowing == true) {
			followDao.followingDelete(followWho, memberNo);
		}
		
		BlockDto blockDto = blockDao.selectOne(followWho,memberNo);
		
		//회원 차단
		if(blockDto == null) {
			blockDao.blockMember(followWho , memberNo);
		}
		else {
			blockDao.unBlockMember(followWho, memberNo);
		}
		
	}
	
	

}
