package com.kh.mars.service;

public interface BoardLikeService {
	
	int boardLike(int memberNo, int boardNo);

	int boardAdLike(int memberNo, int board);
	
}
