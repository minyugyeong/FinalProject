package com.kh.mars.service;

import java.net.URISyntaxException;

import com.kh.mars.vo.KakaoPayApproveRequestVO;
import com.kh.mars.vo.KakaoPayApproveResponseVO;
import com.kh.mars.vo.KakaoPayReadyRequestVO;
import com.kh.mars.vo.KakaoPayReadyResponseVO;


public interface KakaoPayService {
	KakaoPayReadyResponseVO ready(KakaoPayReadyRequestVO requestVO) throws URISyntaxException;
	KakaoPayApproveResponseVO approve(KakaoPayApproveRequestVO requestVO) throws URISyntaxException;
//	KakaoPayOrderResponseVO order(KakaoPayOrderRequestVO requestVO) throws URISyntaxException;
//	KakaoPayCancelResponseVO cancel(KakaoPayCancelRequestVO requestVO) throws URISyntaxException;
}