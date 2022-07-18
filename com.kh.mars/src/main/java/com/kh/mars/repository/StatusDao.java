package com.kh.mars.repository;

import java.util.List;

import com.kh.mars.vo.JoinGenderVO;
import com.kh.mars.vo.StatusVO;


public interface StatusDao {

	List<JoinGenderVO> joinGender();

	List<StatusVO> memberInterest();

	List<StatusVO> manInterest();

	List<StatusVO> womenInterest();

	List<StatusVO> interestAd();

	List<StatusVO> adSum();

	List<StatusVO> yearSales();

	List<StatusVO> monthSales(int year);

}
