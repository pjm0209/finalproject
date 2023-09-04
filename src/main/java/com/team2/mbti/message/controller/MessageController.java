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
import com.team2.mbti.message.model.SendDmListVO;
import com.team2.mbti.message.model.SendDmVO;

import jakarta.servlet.http.HttpSession;
import lombok.Getter;
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
	public String message_post(@ModelAttribute SendDmListVO sendDmListVo, HttpSession session,Model model) {
		int adminNo=(int)session.getAttribute("adminNo");
		logger.info("쪽지 보내기 처리, 파라미터 sendDmListVo={}", sendDmListVo);
		
		String msg="",url="/admin/message/message";
		List<SendDmVO> list=sendDmListVo.getSendItems();
		int cnt=messageService.insertSendDmToAdmin(sendDmListVo, adminNo);
		logger.info("쪽지 보내기 결과 cnt={}",cnt);
		
		if(cnt>0) {
			msg="쪽지를 보냈습니다.";
		}else {
			msg="쪽지를 보내는중 에러가 발생했습니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
}
