package com.kh.mars.service;

import java.util.List;

import com.kh.mars.vo.SearchVO;

public interface SearchService {

	List<SearchVO> search(int memberNo, String keyword);
}
