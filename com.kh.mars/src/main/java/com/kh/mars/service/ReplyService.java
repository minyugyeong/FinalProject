package com.kh.mars.service;

import com.kh.mars.entity.ReplyDto;

public interface ReplyService {
	
	void insert(int boardNo,ReplyDto replyDto);

}
