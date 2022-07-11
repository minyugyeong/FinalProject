package com.kh.mars.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mars.entity.FollowDto;
import com.kh.mars.repository.FollowDao;

@Service
public class FollowServiceImpl implements FollowService{
	
	@Autowired
	private FollowDao followDao;

	@Override
	public int follow(int followWho, int memberNo, int followConfirm) {
		FollowDto followDto = followDao.selectOne(followWho, memberNo);
		
		if(followDto == null) {
			followDao.follow(followWho, memberNo, followConfirm);
			return followWho;
		}
		else {
			followDao.followDelete(followWho, memberNo);
			return 0;
		}
	}

}
