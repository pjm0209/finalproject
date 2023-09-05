package com.team2.mbti.message.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		String userid=(String)session.getAttribute("userid");
		logger.info("내 쪽지함 페이지, 파라미터 userid={}",userid);
		List<Map<String, Object>> list=messageService.messageViewById(userid);
		logger.info("쪽지 목록 결과 list.size={}",list.size());
		
		model.addAttribute("list", list);
		
		return "main/mypage/myMessage";
	}
	
	@GetMapping("/myMessage/messageDetail")
	public String myMessageWrite_get(@RequestParam(defaultValue = "0") int sendDmNo, Model model) {
		logger.info("회원 - 쪽지 상세 페이지, 파라미터 sendDmNo={}", sendDmNo);
		
		Map<String, Object> map=messageService.selectMessageViewBySendDmNo(sendDmNo);
		logger.info("쪽지 상세보기 결과, map={}",map);
		
		model.addAttribute("map", map);
		
		return "main/mypage/myMessage/messageDetail";
	}
	
	@RequestMapping("/myMessage/messageDelete")
	public String messageDelete(@RequestParam(defaultValue = "0") int sendDmNo) {
		logger.info("회원 - 쪽지 삭제 처리, 파라미터 sendDmNo={}", sendDmNo);
		
		int cnt=messageService.deleteSendDmBySendDmNo(sendDmNo);
		logger.info("쪽지 삭제 결과, cnt={}",cnt);
		
		String msg="",url="/main/mypage/myMessage";
		if(cnt>0) {
			msg="쪽지 삭제 성공";
		}
		
		return "common/message";
	}
}
