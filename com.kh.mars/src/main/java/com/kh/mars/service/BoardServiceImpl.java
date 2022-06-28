package com.kh.mars.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.mars.entity.BoardAttachDto;
import com.kh.mars.entity.BoardDto;
import com.kh.mars.repository.AttachDao;
import com.kh.mars.repository.BoardAttachDao;
import com.kh.mars.repository.BoardDao;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private AttachDao attachDao;
	
	@Autowired
	private BoardAttachDao boardAttachDao;

	
	@Transactional
	@Override
	public void insert(BoardDto boardDto, MultipartFile boardAttach) throws IllegalStateException, IOException {
		
		boardDao.insert(boardDto);
		int attachNo = attachDao.save(boardAttach);
		
		boardAttachDao.insert(BoardAttachDto.builder()
															.boardNo(boardDto.getBoardNo())
															.attachNo(attachNo)
														.build());
		
	}
	

}
