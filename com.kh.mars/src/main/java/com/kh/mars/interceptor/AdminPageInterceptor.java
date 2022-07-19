package com.kh.mars.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class AdminPageInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		String admin = (String)request.getSession().getAttribute("auth");
		
		if(!admin.equals("관리자")) {
			response.sendRedirect(request.getContextPath()+"/");
			return false;
		}
		else 
			return true;
		}
}
	
	


