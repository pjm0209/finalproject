package com.team2.mbti.message.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.mbti.message.model.MessageService;
import com.team2.mbti.message.model.SendDmListVO;
import com.team2.mbti.message.model.SendDmVO;

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
	public String myMessageWrite_get(@RequestParam(defaultValue = "0") int sendDmNo,@RequestParam String receiveFlag, Model model) {
		logger.info("회원 - 쪽지 상세 페이지, 파라미터 sendDmNo={},receiveFlag={}", sendDmNo, receiveFlag);
		
		Map<String, Object> map=messageService.selectMessageViewBySendDmNo(sendDmNo, receiveFlag);
		logger.info("쪽지 상세보기 결과, map={}",map);
		logger.info("읽은 날짜 업데이트 결과, cnt={}",map.get("cnt"));
		
		model.addAttribute("map", map);
		
		return "main/mypage/myMessage/messageDetail";
	}
	
	@RequestMapping("/myMessage/messageDelete")
	public String messageDelete(@ModelAttribute SendDmListVO sendDmListVo, @RequestParam(defaultValue = "0",required = false) int sendDmNo 
			,Model model) {
		logger.info("회원 - 쪽지 삭제 처리, 파라미터 sendDmListVo={},sendDmNo={}", sendDmListVo,sendDmNo);
		int cnt=0;
		if(sendDmNo!=0) {
			SendDmListVO sendDmListVo2=new SendDmListVO();
			List<SendDmVO> list=new ArrayList<>();
			SendDmVO vo=new SendDmVO();
			vo.setSendDmNo(sendDmNo);
			list.add(vo);
			
			sendDmListVo2.setSendItems(list);
			
			cnt=messageService.deleteSendDmBySendDmNo(sendDmListVo2);
			logger.info("쪽지 삭제 결과, cnt={}",cnt);
		}else {
			cnt=messageService.deleteSendDmBySendDmNo(sendDmListVo);
			logger.info("쪽지 삭제 결과, cnt={}",cnt);
		}
		String msg="쪽지 삭제를 실패하였습니다.",url="/main/mypage/myMessage";
		if(cnt>0) {
			msg="쪽지가 삭제되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/myMessage/messageWrite")
	public String messageWrite(@ModelAttribute SendDmVO sendDmVo, HttpSession session,Model model) {
		int no = (int)session.getAttribute("no");
		logger.info("회원 - 쪽지 보내기, 파라미터 sendDmVo={}, no={}", sendDmVo, no);
		sendDmVo.setNo(no);
		
		int cnt=messageService.insertSendDmToMemberMyMessage(sendDmVo);
		logger.info("마이페이지 - 쪽지보내기 결과 cnt={}",cnt);
		
		String msg="쪽지를 보내는 중에 에러가 발생했습니다.",url="/main/mypage/myMessage";
		if(cnt>0) {
			msg="쪽지를 보냈습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
