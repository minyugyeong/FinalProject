package com.kh.mars.rest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.mars.entity.BoardDto;
import com.kh.mars.repository.BoardDao;
import com.kh.mars.repository.BoardLikeDao;
import com.kh.mars.service.BoardLikeService;
import com.kh.mars.vo.BoardListVO;
import com.kh.mars.vo.BoardMainListVO;

import springfox.documentation.annotations.ApiIgnore;

@RestController
@RequestMapping("/rest/board")
public class BoardRestController {
	
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private BoardLikeService boardLikeService;
	
	@GetMapping("/main")
	public List<BoardMainListVO> mainList(
										@RequestParam int pageCount,
										@RequestParam int uptoNo,
										@ApiIgnore HttpSession session
										) {
			int memberNo = (Integer)session.getAttribute("login");
			List<BoardMainListVO> list =  boardDao.mainList(memberNo, pageCount, uptoNo);
			return list;
	}
	
	@PostMapping("/like")
	public int boardLike(
						@RequestParam int boardNo,
						@ApiIgnore HttpSession session
						) {
		int memberNo = (Integer) session.getAttribute("login");
		return boardLikeService.boardLike(memberNo, boardNo);
		
	}
}














