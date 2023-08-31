package com.team2.mbti.message.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.mbti.member.model.MemberVO;
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
		
		List<MemberVO> list=messageService.selectAllMemberbyDm();
		logger.info("쪽지 관리 - 회원 전체 조회 결과, list.size={}",list.size());
		
		model.addAttribute("list", list);
		
		return "admin/message/message";
	}
	
	@PostMapping("/message")
	public String message_post(@ModelAttribute SendDmVO sendDmVo) {
		logger.info("쪽지 보내기");
		
		int cnt=messageService.insertSendDm(sendDmVo);
		logger.info("쪽지 보내기 결과 cnt={}",cnt);
		
		
		return "admin/message/message";
	}
}
