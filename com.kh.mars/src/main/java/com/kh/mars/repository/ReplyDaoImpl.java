package com.kh.mars.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.ReplyDto;

@Repository
public class ReplyDaoImpl implements ReplyDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insert(ReplyDto replyDto) {
		int seq = this.getSequence();
		replyDto.setReplyNo(seq);
		sqlSession.insert("reply.insert", replyDto);
		return seq;
		
	}

	@Override
	public int getSequence() {
		return sqlSession.selectOne("reply.getSeq");
	}
	
	public boolean delete(int replyNo) {
		return sqlSession.delete("reply.delete", replyNo) > 0;
	}
	
}
