package com.kh.mars.service;

import java.util.List;

import com.kh.mars.vo.AlramVO;

public interface AlramService {
	
	List<AlramVO> selectAlram(int memberNo);

	void check(int memberNo);

	int isRocket(int memberNo);

	int iscCat(int memberNo);

}
