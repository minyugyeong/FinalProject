package com.kh.mars.repository;

import com.kh.mars.entity.ReplyDto;

public interface ReplyDao {

	int getSequence();
	int insert(ReplyDto replyDto);
	boolean delete(int replyNo);
}
