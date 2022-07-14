package com.kh.mars.repository;

import java.util.List;

import com.kh.mars.entity.BoardAdDto;
import com.kh.mars.vo.BoardAdAttachNoMemberVO;
import com.kh.mars.vo.BoardAdAttachNoVO;
import com.kh.mars.vo.BoardAdAttachVO;
import com.kh.mars.vo.BoardAdListSearchVO;
import com.kh.mars.vo.BoardAdMemberVO;
import com.kh.mars.vo.BoardMainListVO;
import com.kh.mars.vo.BoardReplyVO;

public interface BoardAdDao {
	
	BoardAdDto insert(BoardAdDto boardAdDto);

	BoardAdDto selectOne(int boardAdNo);

	BoardAdMemberVO selectMember(int boardAdNo);

	List<BoardAdAttachVO> selectAttach(int boardAdNo);

	void edit(BoardAdDto boardAdDto);

	List<BoardReplyVO> adDetailReply(int memberNo, int boardNo);

	List<BoardMainListVO> mainList(int memberNo);
	void delete(int boardAdNo);

	List<BoardAdAttachNoVO> selectList(int memberNo, int p, int s);

	List<BoardAdAttachNoMemberVO> selectList(BoardAdListSearchVO vo, int p, int s);

	void updateFirst(int boardAdNo);

	int count(BoardAdListSearchVO vo);


	void updateCheck(int boardAdNo);

	void updateSecond(int boardAdNo);

	void updateThird(int boardAdNo);

	int count(int memberNo);




}
