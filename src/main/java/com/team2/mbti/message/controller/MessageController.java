package com.team2.mbti.message.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.mbti.common.SearchVO;
import com.team2.mbti.member.model.MemberVO;
import com.team2.mbti.message.model.MessageService;
import com.team2.mbti.message.model.SendDmListVO;
import com.team2.mbti.message.model.SendDmVO;

import jakarta.servlet.http.HttpSession;
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
	public String message_post(@ModelAttribute MemberVO memberVo, Model model) {
		logger.info("쪽지 관리 검색 처리, 파라미터 memberVo={}",memberVo);
		
		List<MemberVO> list=messageService.selectAllMemberbyDmSearch(memberVo);
		
		model.addAttribute("list", list);
		
		return "admin/message/message";
	}
	
	@RequestMapping("/messageWrite")
	public String messageWrite(@ModelAttribute SendDmListVO sendDmListVo,@RequestParam(required = false) String adminMessageFlag, HttpSession session,Model model) {
		int adminNo=(int)session.getAttribute("adminNo");
		logger.info("쪽지 보내기 처리, 파라미터 sendDmListVo={}", sendDmListVo);
		
		String msg="",url="/admin/message/message";
		int cnt=messageService.insertSendDmToAdmin(sendDmListVo, adminNo);
		logger.info("쪽지 보내기 결과 cnt={}",cnt);
		
		if(cnt>0) {
			msg="쪽지를 보냈습니다.";
			if(adminMessageFlag.equals("Y")) {
				url="/admin/message/adminMessage";
			}
		}else {
			msg="쪽지를 보내는중 에러가 발생했습니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	@GetMapping("/adminMessage")
	public String adminMessage_get(Model model) {
		logger.info("관리자 쪽지 목록");
		
		List<Map<String, Object>> list=messageService.selectMessageViewByAdmin();
		logger.info("관리자 - 쪽지 목록 결과, list.size()={}",list.size());
		
		model.addAttribute("list", list);
		
		return "admin/message/adminMessage";
	}
	
	@PostMapping("/adminMessage")
	public String adminMessage_post(@ModelAttribute SearchVO searchVo ,Model model) {
		logger.info("관리자 쪽지 목록 검색 처리, searchVo={}",searchVo);
		
		List<Map<String, Object>> list=messageService.selectMessageViewByAdminSearch(searchVo);
		
		model.addAttribute("list", list);
		
		return "admin/message/adminMessage";
	}
	
	@ResponseBody
	@RequestMapping("/readDateUpdate")
	public void readDateUpdate(@RequestParam int sendDmNo) {
		logger.info("ajax - 읽은 날짜 업데이트 처리, 파라미터 sendDmNo={}",sendDmNo);
		
		int cnt=messageService.updateReceiveDmReadDate(sendDmNo);
		logger.info("읽은 날짜 업데이트 결과 cnt={}",cnt);
		
	}
	
	@RequestMapping("/messageWrite2")
	public String messageWrite(@ModelAttribute SendDmVO sendDmVo, HttpSession session,Model model) {
		int adminNo=(int)session.getAttribute("adminNo");
		logger.info("관리자 쪽지 보내기2 처리, sendDmVo={},adminNo={}",sendDmVo,adminNo);
		sendDmVo.setAdminNo(adminNo);
		
		String msg="쪽지를 보내는중에 에러가 발생했습니다",url="/admin/message/adminMessage";
		int cnt=messageService.insertSendDmToAdmin(sendDmVo);
		logger.info("관리자 쪽지 보내기2 결과, cnt={}",cnt);
		
		if(cnt>0) {
			msg="쪽지를 보냈습니다";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/messageDelete")
	public String messageDelete(@ModelAttribute SendDmListVO sendDmListVo,Model model) {
		logger.info("관리자 쪽지 삭제 처리, 파라미터 sendDmListVo={}",sendDmListVo);
		
		int cnt=messageService.deleteSendDmBySendDmNo(sendDmListVo);
		logger.info("관리자 쪽지 삭제 결과 cnt={}",cnt);
		
		String msg="선택한 쪽지들을 삭제도중 에러가 발생하였습니다",url="/admin/message/adminMessage";
		if(cnt>0) {
			msg="선택한 쪽지들을 삭제하였습니다";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
