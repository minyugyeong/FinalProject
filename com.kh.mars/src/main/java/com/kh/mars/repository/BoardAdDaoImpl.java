package com.kh.mars.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.BoardAdDto;
import com.kh.mars.vo.BoardAdAttachVO;
import com.kh.mars.vo.BoardAdMemberVO;

@Repository
public class BoardAdDaoImpl implements BoardAdDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public BoardAdDto insert(BoardAdDto boardAdDto) {
		int boardAdNo = sqlSession.selectOne("board_ad.sequence");
		boardAdDto.setBoardAdNo(boardAdNo);
		boardAdDto.setBoardAdCount(0);
		sqlSession.insert("board_ad.insert", boardAdDto);
		return sqlSession.selectOne("board_ad.selectOne", boardAdNo);
	}

	@Override
	public BoardAdDto selectOne(int boardAdNo) {
		
		return sqlSession.selectOne("board_ad.selectOne", boardAdNo);
	}

	@Override
	public BoardAdMemberVO selectMember(int boardAdNo) {
		
		return sqlSession.selectOne("board_ad.selectBoardAdMember", boardAdNo);
	}

	@Override
	public List<BoardAdAttachVO> selectAttach(int boardAdNo) {
		
		return sqlSession.selectList("board_ad.selectAttach", boardAdNo);
	}

	@Override
	public void edit(BoardAdDto boardAdDto) {
		
		sqlSession.update("board_ad.edit", boardAdDto);
		
	}
	
	
	

}











