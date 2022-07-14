package com.kh.mars.controller;


import java.net.URISyntaxException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.mars.entity.AdDto;
import com.kh.mars.entity.BoardAdDto;
import com.kh.mars.repository.AdDao;
import com.kh.mars.repository.BoardAdDao;
import com.kh.mars.repository.MemberDao;
import com.kh.mars.repository.PaymentDao;
import com.kh.mars.service.KakaoPayService;
import com.kh.mars.service.PaymentService;
import com.kh.mars.vo.KakaoPayApproveRequestVO;
import com.kh.mars.vo.KakaoPayApproveResponseVO;
import com.kh.mars.vo.KakaoPayReadyRequestVO;
import com.kh.mars.vo.KakaoPayReadyResponseVO;
import com.kh.mars.vo.PurchaseVO;



@Controller
public class PayController {
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	KakaoPayService kakaoPayService;

	@Autowired
	private PaymentDao paymentDao;
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private BoardAdDao boardAdDao;
	
	
	
	@PostMapping("/pay_purchase")
	public String payPurchase(@ModelAttribute PurchaseVO purchaseVO, HttpSession session) throws URISyntaxException {
		BoardAdDto boardAdDto = paymentDao.find(purchaseVO.getBoardAdNo());
		if(boardAdDto == null) {
			return "redirect:pay_purcahse";
		}
		int memberNo = (Integer)session.getAttribute("login");
		String memberNick= memberDao.nick(memberNo);
		int price= boardAdDto.getBoardAdPrice();
		int paymentNo= paymentDao.sequence();
		
		KakaoPayReadyRequestVO requestVO = KakaoPayReadyRequestVO.builder()
																			.partner_order_id(String.valueOf(paymentNo))
																			.partner_user_id(memberNick)
																			.item_name(String.valueOf (boardAdDto.getAdNo()))
																			.quantity(purchaseVO.getQuantity())
																			.total_amount(price)
																	.build();
		KakaoPayReadyResponseVO responseVO = kakaoPayService.ready(requestVO);
		
		session.setAttribute("pay", KakaoPayApproveRequestVO.builder()
																			.tid(responseVO.getTid())
																			.partner_order_id(requestVO.getPartner_order_id())
																			.partner_user_id(requestVO.getPartner_user_id())
																		.build());
		session.setAttribute("purchase", List.of(purchaseVO));
		session.setAttribute("boardNo", boardAdDto.getBoardAdNo());
		session.setAttribute("paymentNo", paymentNo);
		
		return "redirect:"+responseVO.getNext_redirect_pc_url();
	}
	
	@GetMapping("/pay/approve")
	public String paySuccess(@RequestParam String pg_token, HttpSession session, RedirectAttributes attr ) throws URISyntaxException {
	
		int memberNo=(Integer)session.getAttribute("login");
		int boardAdNo=(Integer) session.getAttribute("boardNo");
		KakaoPayApproveRequestVO requestVO = 
									(KakaoPayApproveRequestVO) session.getAttribute("pay");
		session.removeAttribute("pay");
		
		List<PurchaseVO> purchaseList = (List<PurchaseVO>) session.getAttribute("purchase");
		session.removeAttribute("purchase");
		
		int paymentNo = (int) session.getAttribute("paymentNo");
		session.removeAttribute("paymentNo");
		
		//주어진 정보를 토대로 승인(approve) 요청을 보낸다
		requestVO.setPg_token(pg_token);
		KakaoPayApproveResponseVO responseVO = kakaoPayService.approve(requestVO);
		
		paymentService.insert(memberNo, paymentNo, responseVO, purchaseList);
		boardAdDao.updateCheck(boardAdNo);
		session.removeAttribute("boardNo");
		attr.addAttribute("memberNo", memberNo);
		return "redirect:/member/ad";
	}

}
