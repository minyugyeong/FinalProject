package com.kh.mars.service;

import java.io.IOException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.mars.entity.DmDto;
import com.kh.mars.entity.DmRecordDto;
import com.kh.mars.repository.AttachDao;
import com.kh.mars.repository.DmDao;

@Repository
public class DmServiceImpl implements DmService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DmDao dmDao;
	
	@Autowired
	private AttachDao attachDao;
	
	@Override
	public int dmSeq() {
		return sqlSession.selectOne("dm.dmSequence");
	}

	@Override
	public int dmInsert(String content, int dmType) {
		int dmNo = this.dmSeq();
		DmDto dmDto = new DmDto();
		dmDto.setDmNo(dmNo);
		dmDto.setDmContent(content);
		dmDto.setDmType(dmType);
		sqlSession.insert("dm.insertDm", dmDto);
		return dmNo;
	}

	@Override
	public void recordInsert(DmRecordDto dmRecordDto) {
		sqlSession.insert("dm.insertRecord", dmRecordDto);
	}
	
	@Transactional
	@Override
	public void dmService(int roomNo, String content, int target, int who) {
		System.out.println("1번구간");
		int dmNo = this.dmInsert(content, 0);
		DmRecordDto dmRecordDto = new DmRecordDto();
		dmRecordDto.setDmNo(dmNo);
		dmRecordDto.setTarget(target);
		dmRecordDto.setWho(who);
		dmRecordDto.setRoomNo(roomNo);
		System.out.println("2번구간");
		
		this.recordInsert(dmRecordDto);
	}
	
	@Transactional
	@Override
	public void dmPhoto(int roomNo, String content, int target, int who) {
		System.out.println("1번구간");
		int dmNo = this.dmInsert(content, 1);
		DmRecordDto dmRecordDto = new DmRecordDto();
		dmRecordDto.setDmNo(dmNo);
		dmRecordDto.setTarget(target);
		dmRecordDto.setWho(who);
		dmRecordDto.setRoomNo(roomNo);
		System.out.println("2번구간");
		
		this.recordInsert(dmRecordDto);
	}
	
	
	@Transactional
	@Override
	public int room(int memberNo, int targetNo) {
		int roomNo = dmDao.roomSearch(memberNo, targetNo);
		if(roomNo>0) {
			return roomNo;
		}else {
			roomNo = dmDao.roomCreate();
			dmDao.roomEnter(roomNo, memberNo);
			dmDao.roomEnter(roomNo, targetNo);
			return roomNo;
		}
	}

	@Override
	public int sendPhoto(MultipartFile frm) throws IllegalStateException, IOException {
		int attachNo = attachDao.save(frm);
		return attachNo;
	}
	
	
}
