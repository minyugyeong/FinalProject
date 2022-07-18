package com.kh.mars.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.mars.entity.BoardAttachDto;
import com.kh.mars.entity.BoardDto;
import com.kh.mars.repository.AttachDao;
import com.kh.mars.repository.BoardAttachDao;
import com.kh.mars.repository.BoardDao;
import com.kh.mars.repository.BoardHashtagDao;
import com.kh.mars.repository.BoardMemberTagDao;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private AttachDao attachDao;
	
	@Autowired
	private BoardAttachDao boardAttachDao;
	
	@Autowired
	private BoardHashtagDao boardHashtagDao;
	
	@Autowired
	private BoardMemberTagDao boardMemberTagDao;

	
	@Transactional
	@Override
	public void insert(BoardDto boardDto, List<MultipartFile> boardAttach) throws IllegalStateException, IOException {
		
		boardDao.insert(boardDto);
		
		for(MultipartFile file : boardAttach) {
			int attachNo = attachDao.save(file);
			
			boardAttachDao.insert(BoardAttachDto.builder()
																.boardNo(boardDto.getBoardNo())
																.attachNo(attachNo)
															.build());
		}
		
	}

	@Transactional
	@Override
	public void delete(int boardNo) {
		boardDao.delete(boardNo);
		boardAttachDao.delete(boardNo);
		boardHashtagDao.delete(boardNo);
		boardMemberTagDao.delete(boardNo);
		
	}

}
