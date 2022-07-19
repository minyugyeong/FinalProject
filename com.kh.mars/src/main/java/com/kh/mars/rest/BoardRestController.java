package com.kh.mars.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.mars.repository.BoardDao;
import com.kh.mars.repository.BoardLikeDao;
import com.kh.mars.service.BoardLikeService;
import com.kh.mars.vo.BoardLikeListVO;
import com.kh.mars.vo.BoardMainListVO;
import com.kh.mars.vo.BoardReplyVO;

import springfox.documentation.annotations.ApiIgnore;

@RestController
@RequestMapping("/rest/board")
public class BoardRestController {
	
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private BoardLikeService boardLikeService;
	@Autowired
	private BoardLikeDao boardLikeDao;
	
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
						@RequestBody String boardNo,
						@ApiIgnore HttpSession session
						) throws JsonMappingException, JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> json = mapper.readValue(boardNo, HashMap.class);
		int board = Integer.parseInt(json.get("boardNo").toString());
		int memberNo = (Integer)session.getAttribute("login");
		return boardLikeService.boardLike(memberNo, board);
	}
	
	@GetMapping("/detail_reply/{boardNo}")
	public List<BoardReplyVO> detailReply(
								@PathVariable int boardNo,
								HttpSession session) {
		int memberNo = (Integer)session.getAttribute("login");
		return boardDao.detailReply(memberNo, boardNo);
	}
	
	@GetMapping("/board_like")
	public List<BoardLikeListVO> boardLikeList(
			@RequestParam int boardNo,
			HttpSession session){
		int memberNo = (Integer)session.getAttribute("login");
		return boardLikeDao.boardLikeList(memberNo, boardNo);
	}
	
}














