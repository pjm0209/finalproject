package com.team2.mbti.message.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.mbti.message.model.MessageService;
import com.team2.mbti.message.model.SendDmVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/message")
@RequiredArgsConstructor
public class MessageController {
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	private final MessageService messageService;
	
	@GetMapping("/message")
	public String message_get(Model model) {
		logger.info("쪽지 관리 페이지");
		
		return "admin/message/message";
	}
	
	@PostMapping("/message")
	public String message_post(@ModelAttribute SendDmVO sendDmVo) {
		logger.info("쪽지 보내기");
		
		int cnt=messageService.insertSendDm(sendDmVo);
		logger.info("");
		
		
		return "admin/message/message";
	}
}
