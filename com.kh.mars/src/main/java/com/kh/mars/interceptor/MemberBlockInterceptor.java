package com.kh.mars.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.mars.entity.BlockDto;
import com.kh.mars.repository.BlockDao;

@Component
public class MemberBlockInterceptor implements HandlerInterceptor{
	
	@Autowired
	private BlockDao blockDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		int followWho = Integer.parseInt(request.getParameter("memberNo"));
		int memberNo = (Integer) request.getSession().getAttribute("login");
		
		BlockDto blockMember = blockDao.selectOne(followWho, memberNo);
		
		if(blockMember != null) {
			response.sendRedirect(request.getContextPath()+"/member/block");
			return false;
		}
		else {
			return true;
		}
		
		
	}

}
