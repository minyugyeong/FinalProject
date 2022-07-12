package com.kh.mars.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mars.entity.AdDto;
import com.kh.mars.entity.PaymentDetailDto;
import com.kh.mars.entity.PaymentDto;
import com.kh.mars.repository.PaymentDao;
import com.kh.mars.vo.KakaoPayApproveResponseVO;
import com.kh.mars.vo.PurchaseVO;


@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentDao paymentDao;


	@Transactional
	@Override
	public void insert(int memberNo,int paymentNo, KakaoPayApproveResponseVO responseVO, List<PurchaseVO> purchaseList) {
		//결제 승인까지 완료된 현 시점에서 결제 정보들을 DB에 저장해야 한다
		//- PaymentDto : KakaoPayApproveResponseVO에 있는 정보로 등록이 가능
		//- PaymentDetailDto : 추가 정보가 없다면 등록이 불가능하다
		PaymentDto paymentDto = PaymentDto.builder()
														.memberNo(memberNo)
														.paymentNo(paymentNo)
														.paymentTid(responseVO.getTid())
														.paymentName(responseVO.getItem_name())
														.paymentTotal(responseVO.getAmount().getTotal())
													.build();
		paymentDao.insertPayment(paymentDto);

//		//purchaseList에 들어있는 상품 번호와 상품 수량을 토대로 상세 정보를 등록
//		for(PurchaseVO purchaseVO : purchaseList) {
//			AdDto adDto = paymentDao.find(purchaseVO.getAd_no());
//			PaymentDetailDto paymentDetailDto = PaymentDetailDto.builder()
//																	.paymentNo(paymentNo)
//																	.paymentDetailName(String.valueOf(adDto.getAdNo()))
//																	.paymentDetailPrice(adDto.getAdPrice())
//																.build();
//			paymentDao.insertPaymentDetail(paymentDetailDto);
//		}
	}

}