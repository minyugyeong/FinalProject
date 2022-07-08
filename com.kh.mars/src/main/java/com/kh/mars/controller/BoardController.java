package com.kh.mars.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.mars.entity.BoardDto;
import com.kh.mars.entity.BoardHashtagDto;
import com.kh.mars.entity.BoardMemberTagDto;
import com.kh.mars.entity.HashtagDto;
import com.kh.mars.entity.MemberDto;
import com.kh.mars.repository.BoardDao;
import com.kh.mars.repository.BoardHashtagDao;
import com.kh.mars.repository.BoardMemberTagDao;
import com.kh.mars.repository.HashtagDao;
import com.kh.mars.repository.MemberDao;
import com.kh.mars.repository.MemberProfileDao;
import com.kh.mars.service.BoardService;
import com.kh.mars.vo.BoardAttachVO;
import com.kh.mars.vo.BoardMemberVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MemberProfileDao memberProfileDao;
	
	@Autowired
	private HashtagDao hashtagDao;
	
	@Autowired
	private BoardHashtagDao boardHashtagDao;
	
	@Autowired
	private BoardMemberTagDao boardMemberTagDao;

	
	
	//등록
	@GetMapping("/insert")
	public String insert(HttpSession session, Model model) {
		
		Integer memberNo = (Integer)session.getAttribute("login");
		
		String memberNick = memberDao.nick(memberNo);
		Integer attachNo = memberProfileDao.selectAttachNo(memberNo);
		
		model.addAttribute("memberNick", memberNick);
		model.addAttribute("attachNo", attachNo);
		 
		return "/board/insert";
	}
	
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute BoardDto boardDto, 
			HttpSession session, 
			RedirectAttributes attr,
			@RequestParam(value="boardAttach", required=false) List<MultipartFile> boardAttach,
			Model model,
			@ModelAttribute HashtagDto hashtagDto,
			@ModelAttribute BoardHashtagDto boardHashtagDto,
			@ModelAttribute BoardMemberTagDto boardMemberTagDto,
			@ModelAttribute MemberDto memberDto) throws IllegalStateException, IOException {
		
		Integer memberNo = (Integer)session.getAttribute("login");
		boardDto.setMemberNo(memberNo);
	
		boardService.insert(boardDto, boardAttach);
		
		
		//해시태그 저장하기
		if(hashtagDto.getHashtagName() != null) {
			
			String inputHashtagName = hashtagDto.getHashtagName();
			String[] array = inputHashtagName.split(" ");
			
			for(int i = 0; i < array.length; i++) {
				String hashtagName = array[i];
				
				HashtagDto hashtagDtoFind = hashtagDao.selectOne(hashtagName);
				if(hashtagDtoFind == null) {
					
					hashtagDto.setHashtagName(hashtagName);
					hashtagDao.insert(hashtagDto);
					
					boardHashtagDto.setBoardNo(boardDto.getBoardNo());
					boardHashtagDto.setHashtagNo(hashtagDto.getHashtagNo());
					boardHashtagDao.insert(boardHashtagDto);
				}
				else {
					boardHashtagDto.setBoardNo(boardDto.getBoardNo());
					boardHashtagDto.setHashtagNo(hashtagDtoFind.getHashtagNo());
					boardHashtagDao.insert(boardHashtagDto);
				}
				
			}
			
		}
		
		//사람태그 저장하기
		if(memberDto.getMemberNick() != null) {
			
			String inputMemberNick = memberDto.getMemberNick();
			String[] array = inputMemberNick.split(" ");
			
			for(int i = 0; i < array.length; i++) {
				String memberNick = array[i];
				Integer tagMemberNo = memberDao.selectNo(memberNick.replace("@",""));
				
				boardMemberTagDto.setBoardNo(boardDto.getBoardNo());
				boardMemberTagDto.setMemberNo(tagMemberNo);
				boardMemberTagDao.insert(boardMemberTagDto);
				
			}
		}
		
		attr.addAttribute("memberNo", memberNo);
		
		return "redirect:/member/page";
		
	}
	
	//수정
	@GetMapping("/edit")
	public String edit(@RequestParam int boardNo, Model model) {
		
		//게시판 값 불러오기
		BoardDto boardDto = boardDao.selectOne(boardNo);
		
		//해시태그 값 불러오기
		List<String> boardHashtagNameList = boardHashtagDao.selectList(boardNo);
		String hashtagName = String.join(" ", boardHashtagNameList);
		
		//사람태그 값 불러오기
		List<String> memberHashList = boardMemberTagDao.selectList(boardNo);
		for(int i = 0; i < memberHashList.size(); i++) {
			memberHashList.set(i, "@"+memberHashList.get(i));			
		}
		String memberHashName = String.join(" ", memberHashList);
		
		//작성자 정보 불러오기
		BoardMemberVO boardMemberVO = boardDao.selectMember(boardNo);
		
		//게시판 첨부파일 불러오기
		List<BoardAttachVO> boardAttachVO = boardDao.selectAttach(boardNo);
		
		model.addAttribute("boardDto", boardDto);
		model.addAttribute("hashtagName", hashtagName);
		model.addAttribute("memberHashName", memberHashName);
		model.addAttribute("boardMemberVO", boardMemberVO);
		model.addAttribute("boardAttachVO", boardAttachVO);
		
		
		return "board/edit";
	}
	
	@PostMapping("/edit")
	public String edit(
			@ModelAttribute BoardDto boardDto,
			@ModelAttribute HashtagDto hashtagDto,
			@ModelAttribute BoardHashtagDto boardHashtagDto,
			@ModelAttribute MemberDto memberDto,
			@ModelAttribute BoardMemberTagDto boardMemberTagDto,
			HttpSession session,
			RedirectAttributes attr
			) {
		
		boardDao.edit(boardDto);
	
		//해시태그 삭제하고, 다시 저장하기
		boardHashtagDao.delete(boardDto.getBoardNo());
		
		if(hashtagDto.getHashtagName() != null) {
			
			String inputHashtagName = hashtagDto.getHashtagName();
			String[] array = inputHashtagName.split(" ");
			
			for(int i = 0; i < array.length; i++) {
				String hashtagName = array[i];
				
				HashtagDto hashtagDtoFind = hashtagDao.selectOne(hashtagName);
				if(hashtagDtoFind == null) {
					
					hashtagDto.setHashtagName(hashtagName);
					hashtagDao.insert(hashtagDto);
					
					boardHashtagDto.setBoardNo(boardDto.getBoardNo());
					boardHashtagDto.setHashtagNo(hashtagDto.getHashtagNo());
					boardHashtagDao.insert(boardHashtagDto);
				}
				else {
					boardHashtagDto.setBoardNo(boardDto.getBoardNo());
					boardHashtagDto.setHashtagNo(hashtagDtoFind.getHashtagNo());
					boardHashtagDao.insert(boardHashtagDto);
				}
				
			}
			
		}
		
		//사람태그 삭제하고, 다시 저장하기
		boardMemberTagDao.delete(boardDto.getBoardNo());
		
		if(memberDto.getMemberNick() != null) {
			
			String inputMemberNick = memberDto.getMemberNick();
			String[] array = inputMemberNick.split(" ");
			
			for(int i = 0; i < array.length; i++) {
				String memberNick = array[i];
				Integer tagMemberNo = memberDao.selectNo(memberNick.replace("@",""));
				
				boardMemberTagDto.setBoardNo(boardDto.getBoardNo());
				boardMemberTagDto.setMemberNo(tagMemberNo);
				boardMemberTagDao.insert(boardMemberTagDto);
				
			}
		}
		
		
		Integer memberNo = (Integer)session.getAttribute("login");
		attr.addAttribute("memberNo", memberNo);
		
		return "redirect:/member/page";
	}

}











