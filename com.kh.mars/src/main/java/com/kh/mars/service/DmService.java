package com.kh.mars.service;

import com.kh.mars.entity.DmDto;
import com.kh.mars.entity.DmRecordDto;

public interface DmService {
	
	int dmSeq();
	int dmInsert(String content);
	void recordInsert(DmRecordDto dmRecordDto);
	void dmService(int roomNo, String content, int target, int who);
	int room(int memberNo, int targetNo);
}
