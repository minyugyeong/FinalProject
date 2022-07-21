package com.kh.mars.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.kh.mars.entity.DmDto;
import com.kh.mars.entity.DmRecordDto;

public interface DmService {
	
	int dmSeq();
	int dmInsert(String content, int dmType);
	void recordInsert(DmRecordDto dmRecordDto);
	void dmService(int roomNo, String content, int target, int who);
	void dmPhoto(int roomNo, String content, int target, int who);
	int room(int memberNo, int targetNo);
	int sendPhoto(MultipartFile frm) throws IllegalStateException, IOException;
}
