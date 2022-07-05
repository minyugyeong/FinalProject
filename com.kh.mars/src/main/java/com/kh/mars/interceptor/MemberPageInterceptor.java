//package com.kh.mars.interceptor;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.stereotype.Component;
//import org.springframework.web.servlet.HandlerInterceptor;
//
//import com.kh.mars.entity.MemberDto;
//
//@Component
//public class MemberPageInterceptor implements HandlerInterceptor{
//	//비공개 계정이면서 팔로우 상태가 아닌 경우
//	// member 테이블에서 member_private = 1  -> 비공개 계정
//	// follow 테이블에 존재하지 않거나 follow_confirm이 0인 경우
//
//	//나를 차단한 계정
//	//block 테이블에 존재하는 경우
//
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		int memberNo = (Integer)request.getParameter(memberNo);
//		return HandlerInterceptor.super.preHandle(request, response, handler);
//	}
//}
