package com.kh.mars.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
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
	private SqlSession sqlSession;
	
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
	
	
	@Transactional
	@Override
	public void boardAdCount(int memberNo, int boardAdNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", memberNo);
		param.put("boardAdNo", boardAdNo);
		Integer isChecked = sqlSession.selectOne("board_ad.checkedAd", param);
		System.out.println("실행 안되냐");
		if(isChecked != null) {
			return;
		}else {
			sqlSession.update("board_ad.adCountMinus", boardAdNo);
			sqlSession.insert("board_ad.checkAd", param);
			sqlSession.update("board_ad.adIsEnd");
		}
	}

	@Scheduled(cron = "0 0 0 * * *")
	@Override
	public void boardAdCheckReset() {
		System.out.println("체크초기화");
		sqlSession.delete("board_ad.deleteCheckedAd");
	}
	
	
	

}








