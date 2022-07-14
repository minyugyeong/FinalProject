package com.kh.mars.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.mars.repository.BoardAdDao;
import com.kh.mars.service.BoardLikeService;
import com.kh.mars.vo.BoardMainListVO;
import com.kh.mars.vo.BoardReplyVO;

import springfox.documentation.annotations.ApiIgnore;

@RestController
public class BoardAdRestController {
	
	@Autowired
	private BoardAdDao boardAdDao;
	
	@Autowired
	private BoardLikeService boardLikeService;
	
	@GetMapping("/rest/board_ad/detail_reply/{boardNo}")
	public List<BoardReplyVO> adDetailReply(
								@PathVariable int boardNo,
								HttpSession session) {
		int memberNo = (Integer)session.getAttribute("login");
		return boardAdDao.adDetailReply(memberNo, boardNo);
	}
	
	@GetMapping("/rest/board_ad/main")
	public List<BoardMainListVO> main(
										HttpSession session
										){
		int memberNo = (Integer) session.getAttribute("login");
		return boardAdDao.mainList(memberNo);
	}
	
	@PostMapping("/rest/board_ad/like")
	public int boardLike(
						@RequestBody String boardNo,
						@ApiIgnore HttpSession session
						) throws JsonMappingException, JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> json = mapper.readValue(boardNo, HashMap.class);
		int board = Integer.parseInt(json.get("boardNo").toString());
		int memberNo = (Integer)session.getAttribute("login");
		return boardLikeService.boardAdLike(memberNo, board);
	}
	
	
	//비즈니스 회원 광고 진행현황 변경 - 관리자
	@PutMapping("/admin/boardAdList/first")
	public void updateFirst(@RequestParam int boardAdNo) {
		
		boardAdDao.updateFirst(boardAdNo);
	}
	
	@PutMapping("/admin/boardAdList/second")
	public void updateSecond(@RequestParam int boardAdNo) {
		
		boardAdDao.updateSecond(boardAdNo);
	}
	
	@PutMapping("/admin/boardAdList/third")
	public void updateThird(@RequestParam int boardAdNo) {
		
		boardAdDao.updateThird(boardAdNo);
	}
}









