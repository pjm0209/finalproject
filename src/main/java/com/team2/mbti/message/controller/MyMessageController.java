package com.team2.mbti.message.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.mbti.message.model.MessageService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main/mypage")
@RequiredArgsConstructor
public class MyMessageController {
	private static final Logger logger = LoggerFactory.getLogger(MyMessageController.class);
	
	private final MessageService messageService;
	
	@GetMapping("/myMessage")
	public String myMessage_get(HttpSession session,Model model) {
		int no=(int)session.getAttribute("no");
		logger.info("내 쪽지함 페이지, 파라미터 no={}",no);
		List<Map<String, Object>> list=messageService.messageViewByNo(no);
		logger.info("쪽지 목록 결과 list.size={}",list.size());
		
		model.addAttribute("list", list);
		
		return "main/mypage/myMessage";
	}
}
