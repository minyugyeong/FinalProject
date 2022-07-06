package com.kh.mars.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.vo.SearchVO;

@Repository
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<SearchVO> search(int memberNo, String keyword) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", memberNo);
		param.put("keyword", keyword);
		return sqlSession.selectList("search.search", param);
	}

}
