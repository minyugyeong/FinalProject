package com.kh.mars.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.BoardAdLikeDto;
import com.kh.mars.entity.BoardLikeDto;
import com.kh.mars.vo.BoardLikeListVO;

@Repository
public class BoardAdLikeDaoImpl implements BoardAdLikeDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public BoardAdLikeDto selectOne(int memberNo, int boardNo) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", memberNo);
		param.put("boardNo", boardNo);
		
		BoardAdLikeDto boardAdLikeDto = sqlSession.selectOne("boardAdLike.one", param);
		
		return boardAdLikeDto;
	}

	@Override
	public boolean boardAdLike(int memberNo, int boardNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", memberNo);
		param.put("boardNo", boardNo);
		return sqlSession.update("boardAdLike.like", param) > 0;
	}

	@Override
	public boolean boardAdLikeCancel(int memberNo, int boardNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", memberNo);
		param.put("boardNo", boardNo);
		return sqlSession.delete("boardAdLike.cancel", param) > 0;
	}

	@Override
	public List<BoardLikeListVO> boardAdLikeList(int memberNo, int boardNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", memberNo);
		param.put("boardNo", boardNo);
		return sqlSession.selectList("boardAdLike.boardAdLikeList",param);
	}

}
