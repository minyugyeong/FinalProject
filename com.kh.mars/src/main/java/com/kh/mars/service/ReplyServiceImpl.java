package com.kh.mars.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mars.entity.ReplyDto;
import com.kh.mars.repository.ReplyDao;

@Repository
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyDao replyDao;
	@Autowired
	private SqlSession sqlSession;

	@Transactional
	@Override
	public void insert(int boardNo,ReplyDto replyDto) {
		int replyNo = replyDao.insert(replyDto);
		System.out.println(replyNo);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("boardNo", boardNo);
		param.put("replyNo", replyNo);
		sqlSession.insert("reply.boardReplyInsert", param);
	}
	
	@Transactional
	@Override
	public void insertAd(int boardNo, ReplyDto replyDto) {
		int replyNo = replyDao.insert(replyDto);
		System.out.println(replyNo);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("boardNo", boardNo);
		param.put("replyNo", replyNo);
		sqlSession.insert("reply.boardAdReplyInsert", param);
	}

}
