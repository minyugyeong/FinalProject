package com.kh.mars.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.AdDto;
import com.kh.mars.entity.BoardAdDto;
import com.kh.mars.entity.PaymentDetailDto;
import com.kh.mars.entity.PaymentDto;

@Repository
public class PaymentDaoImpl implements PaymentDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public BoardAdDto find(int ad_no) {
		return sqlSession.selectOne("payment.adOne", ad_no);
	}

	@Override
	public int sequence() {
		return sqlSession.selectOne("payment.sequence");
	}

	@Override
	public void insertPayment(PaymentDto paymentDto) {
		sqlSession.insert("payment.insert", paymentDto);
		
	}

	@Override
	public void insertPaymentDetail(PaymentDetailDto paymentDetailDto) {
		int sequence = sqlSession.selectOne("paymentDetail.sequence");
		
	}

}
