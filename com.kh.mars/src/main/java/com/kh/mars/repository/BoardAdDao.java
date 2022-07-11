package com.kh.mars.repository;

import java.util.List;

import com.kh.mars.entity.BoardAdDto;
import com.kh.mars.vo.BoardAdAttachVO;
import com.kh.mars.vo.BoardAdMemberVO;

public interface BoardAdDao {
	
	BoardAdDto insert(BoardAdDto boardAdDto);

	BoardAdDto selectOne(int boardAdNo);

	BoardAdMemberVO selectMember(int boardAdNo);

	List<BoardAdAttachVO> selectAttach(int boardAdNo);

	void edit(BoardAdDto boardAdDto);

	void delete(int boardAdNo);

	List<BoardAdDto> selectList(int memberNo);

}
