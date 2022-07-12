package com.kh.mars.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.AdDto;
import com.kh.mars.entity.BoardAdDto;
import com.kh.mars.vo.BoardAdAttachNoVO;
import com.kh.mars.vo.BoardAdAttachVO;
import com.kh.mars.vo.BoardAdMemberVO;
import com.kh.mars.vo.BoardMainListVO;
import com.kh.mars.vo.BoardReplyVO;

@Repository
public class BoardAdDaoImpl implements BoardAdDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public BoardAdDto insert(BoardAdDto boardAdDto) {
		int boardAdNo = sqlSession.selectOne("board_ad.sequence");
		boardAdDto.setBoardAdNo(boardAdNo);
		
		AdDto adDto = sqlSession.selectOne("ad.one", boardAdDto.getAdNo());
		boardAdDto.setBoardAdCount(adDto.getAdCount());
		boardAdDto.setBoardAdPrice(adDto.getAdPrice());
		
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
		
		AdDto adDto = sqlSession.selectOne("ad.one", boardAdDto.getAdNo());
		boardAdDto.setBoardAdCount(adDto.getAdCount());
		boardAdDto.setBoardAdPrice(adDto.getAdPrice());
		
		sqlSession.update("board_ad.edit", boardAdDto);
		
	}
	
	@Override
	public List<BoardReplyVO> adDetailReply(int memberNo, int boardNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", memberNo);
		param.put("boardNo", boardNo);
		return sqlSession.selectList("board_ad.detailReply", param);
	}

	@Override
	public List<BoardMainListVO> mainList(int memberNo) {
		return sqlSession.selectList("board_ad.AdTreeSearch", memberNo);
	}

	@Override
	public void delete(int boardAdNo) {
		
		sqlSession.delete("board_ad.delete", boardAdNo);
		
	}

	@Override
	public List<BoardAdAttachNoVO> selectList(int memberNo) {
		
		return sqlSession.selectList("board_ad.treeSearch", memberNo);
	}


	

}











