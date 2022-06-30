package com.kh.mars.rest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.mars.entity.MemberDto;
import com.kh.mars.repository.FollowDao;
import com.kh.mars.vo.FollowRecommendVO;

import springfox.documentation.annotations.ApiIgnore;

@RestController
@RequestMapping("/rest/follow")
public class FollowRestController {
	
	@Autowired
	private FollowDao followDao;
	
	@GetMapping("/recommend_list")
	public List<FollowRecommendVO> recommendList(
										@ApiIgnore HttpSession session){
		session.setAttribute("login", 1);//준엽지우기
		int memberNo = (Integer) session.getAttribute("login");
		return followDao.recommendList(memberNo);
	}
	

}
