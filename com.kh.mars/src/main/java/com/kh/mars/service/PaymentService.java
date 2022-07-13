package com.kh.mars.service;

import java.util.List;

import com.kh.mars.vo.KakaoPayApproveResponseVO;
import com.kh.mars.vo.PurchaseVO;

public interface PaymentService {

	void insert(int memberNo, int paymentNo, KakaoPayApproveResponseVO responseVO, List<PurchaseVO> purchaseList);

}