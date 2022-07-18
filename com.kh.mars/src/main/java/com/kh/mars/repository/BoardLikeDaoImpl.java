package com.kh.mars.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.BoardLikeDto;
import com.kh.mars.vo.BoardLikeListVO;

@Repository
public class BoardLikeDaoImpl implements BoardLikeDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public BoardLikeDto selectOne(int memberNo, int boardNo) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", memberNo);
		param.put("boardNo", boardNo);
		
		BoardLikeDto boardLikeDto = sqlSession.selectOne("boardLike.one", param);
		
		return boardLikeDto;
	}

	@Override
	public boolean boardLike(int memberNo, int boardNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", memberNo);
		param.put("boardNo", boardNo);
		return sqlSession.update("boardLike.like", param) > 0;
	}

	@Override
	public boolean boardLikeCancel(int memberNo, int boardNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", memberNo);
		param.put("boardNo", boardNo);
		return sqlSession.delete("boardLike.cancel", param) > 0;
	}

	@Override
	public List<BoardLikeListVO> boardLikeList(int memberNo, int boardNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", memberNo);
		param.put("boardNo", boardNo);
		return sqlSession.selectList("boardLike.boardLikeList", param);
	}

}
