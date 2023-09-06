package com.team2.mbti.member.controller;

import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

@Component
public class LoginInterceptor2 implements HandlerInterceptor{
	private static final Logger logger=LoggerFactory.getLogger(LoginInterceptor2.class);
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
			throws Exception {
		
		String userid=(String) request.getSession().getAttribute("userid");		
		logger.info("preHandle() 호출!, userid={}", userid);
		
		if(userid==null || userid.isEmpty()) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			//out.print("alert('먼저 로그인하세요!');");
			out.print("location.href='"+ request.getContextPath() +"/loginFirst2';");			
			out.print("</script>");
			
			return false;
		}else {
			return true; 
		}
			
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("postHandle() 호출!");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logger.info("afterCompletion() 호출!");
	}

}
