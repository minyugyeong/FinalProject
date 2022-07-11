package com.kh.mars.repository;

import java.util.List;

import com.kh.mars.vo.AdStatusVO;
import com.kh.mars.vo.JoinGenderVO;
import com.kh.mars.vo.MemberInterestVO;


public interface StatusDao {

	List<JoinGenderVO> joinGender();

	List<MemberInterestVO> memberInterest();

	List<MemberInterestVO> manInterest();

	List<MemberInterestVO> womenInterest();

	List<AdStatusVO> interestAd();

	List<AdStatusVO> adSum();

}
