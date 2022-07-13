package com.kh.mars.repository;

import java.util.List;

import com.kh.mars.entity.BoardAdDto;
import com.kh.mars.vo.BoardAdAttachNoMemberVO;
import com.kh.mars.vo.BoardAdAttachNoVO;
import com.kh.mars.vo.BoardAdAttachVO;
import com.kh.mars.vo.BoardAdListSearchVO;
import com.kh.mars.vo.BoardAdMemberVO;

public interface BoardAdDao {
	
	BoardAdDto insert(BoardAdDto boardAdDto);

	BoardAdDto selectOne(int boardAdNo);

	BoardAdMemberVO selectMember(int boardAdNo);

	List<BoardAdAttachVO> selectAttach(int boardAdNo);

	void edit(BoardAdDto boardAdDto);

	void delete(int boardAdNo);

	List<BoardAdAttachNoVO> selectList(int memberNo);

	List<BoardAdAttachNoMemberVO> selectList(BoardAdListSearchVO vo, int p, int s);

	BoardAdDto update(BoardAdDto boardAdDto);

	int count(BoardAdListSearchVO vo);

	


}
