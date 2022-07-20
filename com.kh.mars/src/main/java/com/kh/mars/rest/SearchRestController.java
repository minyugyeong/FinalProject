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
import com.kh.mars.vo.BoardMainListVO;
import com.kh.mars.vo.SearchListVO;
import com.kh.mars.vo.SearchVO;

@RestController
@RequestMapping("/rest/search")
public class SearchRestController {

	@Autowired
	private SearchService searchService;
	
	@GetMapping("")
	public List<SearchVO> search(
								@RequestParam String keyword,
								HttpSession session
								){
		int memberNo = (Integer)session.getAttribute("login");
		return searchService.search(memberNo, keyword);
	}
	
	@GetMapping("/list")
	public List<SearchListVO> list(
									HttpSession session,
									@RequestParam int hashTagNo,
									@RequestParam int pageCount,
									@RequestParam int uptoNo,
									@RequestParam int uptoNoAd
									){
		int memberNo = (Integer) session.getAttribute("login");
		return searchService.list(memberNo, hashTagNo, pageCount, uptoNo, uptoNoAd);
	}
	
	@GetMapping("/listlike")
	public List<SearchListVO> listLike(
										HttpSession session,
										@RequestParam int hashTagNo
										){
		int memberNo = (Integer) session.getAttribute("login");
		return searchService.likelist(memberNo, hashTagNo);
	}
	
	@GetMapping("/detail")
	public BoardMainListVO detail(
									@RequestParam int boardNo,
									HttpSession session
									) {
		int memberNo = (Integer)session.getAttribute("login");
		return searchService.boardDetail(boardNo, memberNo);
	}
	
	@GetMapping("/detail_ad")
	public BoardMainListVO adDetail(
									@RequestParam int boardNo,
									HttpSession session
									) {
		int memberNo = (Integer)session.getAttribute("login");
		return searchService.adDetail(boardNo, memberNo);
	}
	
	
	
}
