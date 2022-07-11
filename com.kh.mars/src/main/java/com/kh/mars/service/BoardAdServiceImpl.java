package com.kh.mars.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.mars.entity.BoardAdAttachDto;
import com.kh.mars.entity.BoardAdDto;
import com.kh.mars.repository.AttachDao;
import com.kh.mars.repository.BoardAdAttachDao;
import com.kh.mars.repository.BoardAdDao;
import com.kh.mars.repository.BoardAdHashtagDao;

@Service
public class BoardAdServiceImpl implements BoardAdService {
	
	@Autowired
	private BoardAdDao boardAdDao;
	
	@Autowired
	private AttachDao attachDao;
	
	@Autowired
	private BoardAdAttachDao boardAdAttachDao;
	
	@Autowired
	private BoardAdHashtagDao boardAdHashtagDao;

	@Transactional
	@Override
	public void insert(BoardAdDto boardAdDto, List<MultipartFile> boardAdAttach) throws IllegalStateException, IOException {
		
		boardAdDao.insert(boardAdDto);
		
		for(MultipartFile file : boardAdAttach) {
			int attachNo = attachDao.save(file);
			
			boardAdAttachDao.insert(BoardAdAttachDto.builder()
																.boardAdNo(boardAdDto.getBoardAdNo())
																.attachNo(attachNo)
															.build());
		}
		
	}
	
	@Transactional
	@Override
	public void delete(int boardAdNo) {
		boardAdDao.delete(boardAdNo);
		boardAdAttachDao.delete(boardAdNo);
		boardAdHashtagDao.delete(boardAdNo);
		
	}
	
	

}








