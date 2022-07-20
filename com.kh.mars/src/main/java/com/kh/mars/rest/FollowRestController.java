package com.kh.mars.rest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
		int memberNo = (Integer) session.getAttribute("login");
		return followDao.recommendList(memberNo);
	}
	
	@PostMapping("/follow_accept")
	public void followAccept(
			HttpSession session,
			@RequestParam int followWho) {
		int followTarget = (Integer)session.getAttribute("login");
		followDao.followAccept(followWho, followTarget);
	}
	
	@PostMapping("/follow_refuse")
	public void followRefuse(
			HttpSession session,
			@RequestParam int followWho) {
		int followTarget = (Integer)session.getAttribute("login");
		followDao.followRefuse(followWho, followTarget);
	}
	

}
