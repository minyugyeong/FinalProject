package com.kh.mars.repository;

import com.kh.mars.entity.AdDto;
import com.kh.mars.entity.BoardAdDto;
import com.kh.mars.entity.PaymentDetailDto;
import com.kh.mars.entity.PaymentDto;

public interface PaymentDao {

	BoardAdDto find(int ad_no);

	int sequence();

	void insertPayment(PaymentDto paymentDto);

	void insertPaymentDetail(PaymentDetailDto paymentDetailDto);

}
