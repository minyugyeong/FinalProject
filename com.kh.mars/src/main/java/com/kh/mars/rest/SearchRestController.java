package com.kh.mars.rest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.mars.service.SearchService;
import com.kh.mars.vo.SearchVO;

@RestController
@RequestMapping("/rest/search")
public class SearchRestController {

	@Autowired
	private SearchService searchService;
	
	@GetMapping("/{keyword}")
	public List<SearchVO> search(
								@PathVariable String keyword,
								HttpSession session
								){
		int memberNo = (Integer)session.getAttribute("login");
		return searchService.search(memberNo, keyword);
	}
}
