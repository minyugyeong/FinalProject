package com.kh.mars.service;

import java.util.List;

import com.kh.mars.vo.BoardMainListVO;
import com.kh.mars.vo.SearchListVO;
import com.kh.mars.vo.SearchVO;

public interface SearchService {

	List<SearchVO> search(int memberNo, String keyword);
	List<SearchListVO> list(int memberNo, int hashTagNo, int pageCount, int uptoNo);
	List<SearchListVO> likelist(int memberNo, int hashTagNo);
	BoardMainListVO boardDetail(int boardNo, int memberNo);
	BoardMainListVO adDetail(int boardNo, int memberNo);
}
