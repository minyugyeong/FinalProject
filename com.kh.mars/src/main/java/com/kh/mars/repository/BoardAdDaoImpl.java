package com.kh.mars.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.AdDto;
import com.kh.mars.entity.BoardAdDto;
import com.kh.mars.vo.BoardAdAttachNoMemberVO;
import com.kh.mars.vo.BoardAdAttachNoVO;
import com.kh.mars.vo.BoardAdAttachVO;
import com.kh.mars.vo.BoardAdListSearchVO;
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
	public List<BoardAdAttachNoVO> selectList(int memberNo, int p, int s) {
		
		Map<String, Object> param = new HashMap<>();
		param.put("memberNo", memberNo);
		
		int end = p * s;
		int begin = end - (s-1);
		param.put("end", end);
		param.put("begin", begin);
		
		return sqlSession.selectList("board_ad.treeSearch", param);
	}

	@Override
	public List<BoardAdAttachNoMemberVO> selectList(BoardAdListSearchVO vo, int p, int s) {
		
		Map<String, Object> param = new HashMap<>();
		param.put("vo", vo);
		
		int end = p * s;
		int begin = end - (s-1);
		param.put("end", end);
		param.put("begin", begin);
		
		return sqlSession.selectList("board_ad.treeSearchAdmin", param);
	}

	@Override
	public void updateFirst(int boardAdNo) {
		
		sqlSession.update("board_ad.updateFirst", boardAdNo);
	}

	@Override
	public int count(BoardAdListSearchVO vo) {
		
		return sqlSession.selectOne("board_ad.count", vo);
	}

	@Override
	public void updateCheck(int boardAdNo) {
		sqlSession.update("board_ad.updateCheck", boardAdNo);
		
	}


	public void updateSecond(int boardAdNo) {
		
		sqlSession.update("board_ad.updateSecond", boardAdNo);
	}


	@Override
	public void updateThird(int boardAdNo) {
		
		sqlSession.update("board_ad.updateThird", boardAdNo);
	}

	@Override
	public int count(int memberNo) {
		
		return sqlSession.selectOne("board_ad.countMemberAd", memberNo);
	}

	

}











