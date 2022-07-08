package com.kh.mars.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import javax.mail.MessagingException;
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

import com.kh.mars.entity.CertDto;
import com.kh.mars.entity.FollowDto;
import com.kh.mars.entity.MemberDto;
import com.kh.mars.error.UnauthorizeException;
import com.kh.mars.repository.BoardDao;
import com.kh.mars.repository.CertDao;
import com.kh.mars.repository.FollowDao;
import com.kh.mars.repository.MemberDao;
import com.kh.mars.repository.MemberProfileDao;
import com.kh.mars.service.EmailService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MemberProfileDao memberProfileDao;
	
	@Autowired
	private FollowDao followDao;
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private CertDao certDao;

	//회원가입 페이지
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}
	@PostMapping("/join")
	public String join(@ModelAttribute MemberDto memberDto) {
		memberDao.join(memberDto);
		return "member/login";
	}
	
	//로그인 페이지
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	//로그인 처리
	@PostMapping("/login")
	public String login(
			@RequestParam String memberEmail,
			@RequestParam String memberPassword,
			HttpSession session) {
		MemberDto memberDto = memberDao.login(memberEmail, memberPassword);
		
		if(memberDto != null) {
			session.setAttribute("login", memberDto.getMemberNo());
			session.setAttribute("auth", memberDto.getMemberGrade());
		}
		return "redirect:/";
	}
	
	@GetMapping("/edit")
	public String edit(HttpSession session, Model model) {
		int memberNo = (Integer)session.getAttribute("login");
		
		MemberDto memberDto = memberDao.info(memberNo);
		model.addAttribute("memberDto", memberDto);
		
		int attachNo = memberProfileDao.info(memberNo);
		if(attachNo == 0) {
			model.addAttribute("profileUrl", "/image/user.jpg");
		}
		else {
			model.addAttribute("profileUrl", "/file/download/" + attachNo);
		}
		
		return "member/edit";
	}
	
	@PostMapping("/edit")
	public String edit(HttpSession session, @ModelAttribute MemberDto memberDto) {
		int memberNo = (Integer)session.getAttribute("login");
		memberDto.setMemberNo(memberNo);
		
		boolean success = memberDao.edit(memberDto);
		if(success) {
			return "redirect:edit";
		}
		else {
			return "redirect:edit?error";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		session.removeAttribute("auth");
		return "member/login";
	}
	
	@PostMapping("/changePassword")
	public String password(
			@RequestParam String currentPassword,
			@RequestParam String changePassword,
			HttpSession session) {
		int memberNo = (Integer)session.getAttribute("login");
		boolean success = memberDao.changePassword(memberNo, currentPassword, changePassword);
		if(success) {
			return "redirect:edit";
		}
		else {
			return "redirect:edit?error";
		}
	}
	
	@PostMapping("/profile")
	public String profile(@RequestParam MultipartFile memberProfile,HttpSession session) throws IllegalStateException, IOException {
		int memberNo = (Integer)session.getAttribute("login");
		memberDao.proFile(memberProfile, memberNo);
		return "/member/edit";
	}
	
	@GetMapping("/page")
	public String page(@RequestParam int memberNo, Model model, HttpSession session) {
		MemberDto memberDto = memberDao.info(memberNo);
		model.addAttribute("memberDto",memberDto);
		
		int followCount = followDao.countFollow(memberNo);
		model.addAttribute("follow",followCount);
		
		int followerCount = followDao.countFollower(memberNo);
		model.addAttribute("follower", followerCount);
		
		int boardCount = boardDao.countBoard(memberNo);
		model.addAttribute("boardNum", boardCount);
		
		//팔로우 버튼
		int followWho = (Integer)session.getAttribute("login");
		
		FollowDto followDto = followDao.selectOne(followWho, memberNo);
		if(followDto == null ) {
			followDto = new FollowDto();
			followDto.setFollowConfirm(2);
			model.addAttribute("followDto", followDto);	
		}
		else {
			model.addAttribute("followDto", followDto);
		}
		
		//내 페이지 확인
		boolean isLogin = followWho != 0;
		boolean isOwner = isLogin && followWho == memberDto.getMemberNo();
		model.addAttribute("isLogin", isLogin);
		model.addAttribute("isOwner", isOwner);
		
		//프로필 사진
		int attachNo = memberProfileDao.info(memberNo);
		if(attachNo == 0) {
			model.addAttribute("profileUrl", "/image/user.jpg");
		}
		else {
			model.addAttribute("profileUrl", "/file/download/" + attachNo);
		}
		
		//계정상태
		//비공개 계정
		int memberPrivate = memberDao.info(memberNo).getMemberPrivate();
		boolean isPrivate = memberPrivate == 1;
		
		model.addAttribute("isPrivate", isPrivate);
		//팔로우 상태
		boolean isFollower = followDao.isFollower(followWho,memberNo);
		model.addAttribute("isFollower", isFollower);

		
		return "member/page";
	}
	
//	//관리자 회원 목록 출력
//	@GetMapping("/admin")
//	public String adminList(
//			@RequestParam(required = false) String type,
//			@RequestParam(required = false) String keyword,
//			@RequestParam(required = false, defaultValue="1") int p,
//			@RequestParam(required = false, defaultValue="10") int s,
//			Model model) {
//		
//		List<MemberDto> list = memberDao.adminSelect(type, keyword, p, s);
//		model.addAttribute("list", list);
//		
//		boolean search = type != null && keyword != null;
//		model.addAttribute("search", list);
//		
//		int count = memberDao.count(type, keyword);
//		int lastPage = (count + s-1)/s;
//		
//		int blockSize = 10;
//		int endBlock = (p+blockSize-1) / blockSize * blockSize;
//		int startBlock = endBlock - (blockSize - 1);
//		if(endBlock > lastPage) {
//			endBlock = lastPage;
//		}
//		
//		model.addAttribute("p", p);
//		model.addAttribute("s", s);
//		model.addAttribute("type", type);
//		model.addAttribute("keyword", keyword);
//		model.addAttribute("lastPage", lastPage);
//		model.addAttribute("startBlock", startBlock);
//		model.addAttribute("endBlock", endBlock);
//		
//		return "member/admin";
//		
//	}
	
	//관리자 회원 목록 출력
	@GetMapping("/list")
	public String list(@ModelAttribute MemberDto memberDto, Model model) {
		List<MemberDto> list = memberDao.selectList(memberDto);
		model.addAttribute("list", list);
		
		return "member/list";
	}
	
	@GetMapping("/password_reset")
	public String passwordReset() {
		return "member/password_reset";
	}
	
	@PostMapping("/password_reset")
	public String passwordReset(@RequestParam String memberEmail) throws MessagingException {
		String findEmail = memberDao.checkEmail(memberEmail);
		
		if(findEmail == null) {
			return "redirect:password_reset?error";
		}
		emailService.sendPasswordResetMail(memberEmail);
		return "redirect:password_reset_send_mail";
	}
	
	@GetMapping("/password_reset_send_mail")
	public String passwordResetSendMail() {
		return "member/password_reset_send_mail";
	}
	
	private Random r = new Random();
	private Format f = new DecimalFormat("000000");
	
	@GetMapping("/reset")
	public String reset(
			@RequestParam String memberEmail,
			@RequestParam String cert,
			Model model) {
		CertDto certDto = CertDto.builder()
				.memberEmail(memberEmail)
				.certNumber(cert)
				.build();
		
		boolean isOk = certDao.check(certDto);
		if(isOk) {
			String newCert = f.format(r.nextInt(1000000));
			certDao.insert(CertDto.builder()
								.memberEmail(memberEmail)
								.certNumber(newCert)
								.build());
			model.addAttribute("cert", newCert);
			
			return "member/reset";
		}
		else {
			throw new UnauthorizeException();
		}
	}
	
	@PostMapping("/reset")
	public String reset(
			@ModelAttribute MemberDto memberDto,
			@RequestParam String cert) {
		boolean isOk = certDao.check(CertDto.builder()
									.memberEmail(memberDto.getMemberEmail())
									.certNumber(cert)
									.build());
		
		if(isOk) {
			boolean result = memberDao.resetPassword(memberDto);
			if(result) {
				return "member/login";
			}
		}
		throw new UnauthorizeException();
	}
	
}











