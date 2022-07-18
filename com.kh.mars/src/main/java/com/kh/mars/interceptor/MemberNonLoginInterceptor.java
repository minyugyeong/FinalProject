package com.kh.mars.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class MemberNonLoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
//		Integer memberNo = (Integer) request.getSession().getAttribute("login");//지우기
		Integer memberNo = 1;
		
		if(memberNo == null) {
			response.sendRedirect(request.getContextPath()+"/member/login");
			return false;
		}
		else {
			return true;
		}
	}
	
}
