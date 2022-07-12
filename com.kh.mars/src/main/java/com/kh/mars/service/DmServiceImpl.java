package com.kh.mars.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mars.entity.DmDto;
import com.kh.mars.entity.DmRecordDto;

@Repository
public class DmServiceImpl implements DmService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int dmSeq() {
		return sqlSession.selectOne("dm.dmSequence");
	}

	@Override
	public int dmInsert(String content) {
		int dmNo = this.dmSeq();
		DmDto dmDto = new DmDto();
		dmDto.setDmNo(dmNo);
		dmDto.setDmContent(content);
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
		int dmNo = this.dmInsert(content);
		DmRecordDto dmRecordDto = new DmRecordDto();
		dmRecordDto.setDmNo(dmNo);
		dmRecordDto.setTarget(target);
		dmRecordDto.setWho(who);
		dmRecordDto.setRoomNo(roomNo);
		System.out.println("2번구간");
		
		this.recordInsert(dmRecordDto);
	}

}
