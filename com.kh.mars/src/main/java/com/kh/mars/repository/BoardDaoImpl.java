package com.kh.mars.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.BoardDto;
import com.kh.mars.vo.BoardListVO;
import com.kh.mars.vo.BoardMainListVO;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	private SqlSession sqlSession;


	@Override
	public BoardDto insert(BoardDto boardDto) {
		int boardNo = sqlSession.selectOne("board.sequence", boardDto);
		boardDto.setBoardNo(boardNo);
		sqlSession.insert("board.insert", boardDto);
		return sqlSession.selectOne("board.selectOne", boardNo);
	}

	
//	메인피드 조회 팔로우 된사람 최신순 비동기
	@Override
	public List<BoardMainListVO> mainList(int memberNo, int pageCount, int uptoNo) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", memberNo);
		param.put("pageCount", pageCount);
		param.put("uptoNo", uptoNo);
		
		
		return sqlSession.selectList("board.boardTreeSearch", param);
	}


	@Override
	public int countBoard(int memberNo) {
		return sqlSession.selectOne("board.boardCount", memberNo);
	}
	
	
	
}
