package com.kh.mars.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.vo.BoardMainListVO;
import com.kh.mars.vo.SearchListVO;
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

	@Override
	public List<SearchListVO> list(int memberNo, int hashTagNo, int pageCount, int uptoNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", memberNo);
		param.put("hashTagNo", hashTagNo);
		param.put("pageCount", pageCount);
		param.put("uptoNo", uptoNo);
		
		return sqlSession.selectList("search.tagSearch", param);
	}

	@Override
	public List<SearchListVO> likelist(int memberNo, int hashTagNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", memberNo);
		param.put("hashTagNo", hashTagNo);
		return sqlSession.selectList("search.tagSearchLike", param);
	}

	@Override
	public BoardMainListVO boardDetail(int boardNo, int memberNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", memberNo);
		param.put("boardNo", boardNo);
		return sqlSession.selectOne("search.searchTreeSearch", param);
	}

	@Override
	public BoardMainListVO adDetail(int boardNo, int memberNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", memberNo);
		param.put("boardNo", boardNo);
		return sqlSession.selectOne("search.adTreeSearch", param);
	}
	
	

}
