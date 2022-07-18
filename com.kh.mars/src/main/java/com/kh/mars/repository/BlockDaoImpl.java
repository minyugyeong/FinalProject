package com.kh.mars.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.BlockDto;

@Repository
public class BlockDaoImpl implements BlockDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public BlockDto selectOne(int followWho, int memberNo) {
		Map<String, Object> param = new HashMap<String,Object>();
		param.put("memberNo", followWho);
		param.put("blockNo", memberNo);
		
		BlockDto blockDto = sqlSession.selectOne("block.one", param);
		
		return blockDto;
	}

	@Override
	public void blockMember(int followWho, int memberNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", followWho);
		param.put("blockNo", memberNo);
		sqlSession.insert("block.block",param);
	}

	@Override
	public void unBlockMember(int followWho, int memberNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", followWho);
		param.put("blockNo", memberNo);
		sqlSession.delete("block.unblock", param);
	}



}
