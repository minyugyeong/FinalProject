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

import com.kh.mars.entity.AdDto;
import com.kh.mars.entity.BoardAdDto;
import com.kh.mars.entity.BoardAdHashtagDto;
import com.kh.mars.entity.BoardDto;
import com.kh.mars.entity.BoardHashtagDto;
import com.kh.mars.entity.BoardMemberTagDto;
import com.kh.mars.entity.HashtagDto;
import com.kh.mars.entity.MemberDto;
import com.kh.mars.repository.AdDao;
import com.kh.mars.repository.BoardAdDao;
import com.kh.mars.repository.BoardAdHashtagDao;
import com.kh.mars.repository.HashtagDao;
import com.kh.mars.repository.MemberDao;
import com.kh.mars.repository.MemberProfileDao;
import com.kh.mars.service.BoardAdService;
import com.kh.mars.vo.BoardAdAttachVO;
import com.kh.mars.vo.BoardAdMemberVO;

@Controller
@RequestMapping("/boardAd")
public class BoardAdController {

	@Autowired
	private BoardAdDao boardAdDao;
	
	@Autowired
	private BoardAdService boardAdService;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MemberProfileDao memberProfileDao;
	
	@Autowired
	private HashtagDao hashtagDao;
	
	@Autowired
	private BoardAdHashtagDao boardAdHashtagDao;
	
	@Autowired
	private AdDao adDao;
	
	
	
	// 등록
	@GetMapping("/insert")
	public String insert(HttpSession session, Model model) {

		Integer memberNo = (Integer) session.getAttribute("login");

		String memberNick = memberDao.nick(memberNo);
		Integer attachNo = memberProfileDao.selectAttachNo(memberNo);
		
		List<AdDto> list = adDao.selectList();

		model.addAttribute("memberNick", memberNick);
		model.addAttribute("attachNo", attachNo);
		model.addAttribute("list", list);

		return "/boardAd/insert";
	}
	

	@PostMapping("/insert")
	public String insert(@ModelAttribute BoardAdDto boardAdDto, HttpSession session, RedirectAttributes attr,
			@RequestParam(value = "boardAdAttach", required = false) List<MultipartFile> boardAdAttach, Model model,
			@ModelAttribute HashtagDto hashtagDto, @ModelAttribute BoardAdHashtagDto boardAdHashtagDto)
			throws IllegalStateException, IOException {

		Integer memberNo = (Integer) session.getAttribute("login");
		boardAdDto.setMemberNo(memberNo);

		boardAdService.insert(boardAdDto, boardAdAttach);

		// 해시태그 저장하기
		if (hashtagDto.getHashtagName() != null) {

			String inputHashtagName = hashtagDto.getHashtagName();
			String[] array = inputHashtagName.split(" ");

			for (int i = 0; i < array.length; i++) {
				String hashtagName = array[i];

				HashtagDto hashtagDtoFind = hashtagDao.selectOne(hashtagName);
				if (hashtagDtoFind == null) {

					hashtagDto.setHashtagName(hashtagName);
					hashtagDao.insert(hashtagDto);

					boardAdHashtagDto.setBoardAdNo(boardAdDto.getBoardAdNo());
					boardAdHashtagDto.setHashtagNo(hashtagDto.getHashtagNo());
					boardAdHashtagDao.insert(boardAdHashtagDto);
				} else {
					boardAdHashtagDto.setBoardAdNo(boardAdDto.getBoardAdNo());
					boardAdHashtagDto.setHashtagNo(hashtagDtoFind.getHashtagNo());
					boardAdHashtagDao.insert(boardAdHashtagDto);
				}

			}

		}

		attr.addAttribute("memberNo", memberNo);

		return "redirect:/member/page";
	}
	
	
	//수정
	@GetMapping("/edit")
	public String edit(@RequestParam int boardAdNo, Model model) {
		
		
		//광고게시판 값 불러오기
		BoardAdDto boardAdDto = boardAdDao.selectOne(boardAdNo);
		
		//해시태그 값 불러오기
		List<String> boardAdHashtagNameList = boardAdHashtagDao.selectList(boardAdNo);
		String hashtagName = String.join(" ", boardAdHashtagNameList);
		
		
		//작성자 정보 불러오기
		BoardAdMemberVO boardAdMemberVO = boardAdDao.selectMember(boardAdNo);
		
		//게시판 첨부파일 불러오기
		List<BoardAdAttachVO> boardAdAttachVO = boardAdDao.selectAttach(boardAdNo);
		
		//광고 목록 불러오기
		List<AdDto> adList = adDao.selectList();
		
		model.addAttribute("boardAdDto", boardAdDto);
		model.addAttribute("hashtagName", hashtagName);
		model.addAttribute("boardAdMemberVO", boardAdMemberVO);
		model.addAttribute("boardAdAttachVO", boardAdAttachVO);
		model.addAttribute("adList", adList);
		
		
		return "boardAd/edit";
	}
	
	@PostMapping("/edit")
	public String edit(
			@ModelAttribute BoardAdDto boardAdDto,
			@ModelAttribute HashtagDto hashtagDto,
			@ModelAttribute BoardAdHashtagDto boardAdHashtagDto,
			@ModelAttribute MemberDto memberDto,
			HttpSession session,
			RedirectAttributes attr
			) {
		
		boardAdDao.edit(boardAdDto);
	
		//해시태그 삭제하고, 다시 저장하기
		boardAdHashtagDao.delete(boardAdDto.getBoardAdNo());
		
		if(hashtagDto.getHashtagName() != null) {
			
			String inputHashtagName = hashtagDto.getHashtagName();
			String[] array = inputHashtagName.split(" ");
			
			for(int i = 0; i < array.length; i++) {
				String hashtagName = array[i];
				
				HashtagDto hashtagDtoFind = hashtagDao.selectOne(hashtagName);
				if(hashtagDtoFind == null) {
					
					hashtagDto.setHashtagName(hashtagName);
					hashtagDao.insert(hashtagDto);
					
					boardAdHashtagDto.setBoardAdNo(boardAdDto.getBoardAdNo());
					boardAdHashtagDto.setHashtagNo(hashtagDto.getHashtagNo());
					boardAdHashtagDao.insert(boardAdHashtagDto);
				}
				else {
					boardAdHashtagDto.setBoardAdNo(boardAdDto.getBoardAdNo());
					boardAdHashtagDto.setHashtagNo(hashtagDtoFind.getHashtagNo());
					boardAdHashtagDao.insert(boardAdHashtagDto);
				}
				
			}
			
		}
		
		Integer memberNo = (Integer)session.getAttribute("login");
		attr.addAttribute("memberNo", memberNo);
		
		return "redirect:/member/page";
	}
	
	

}












