package com.team2.mbti.main.mbti.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.mbti.mbtiResult.model.MbtiResultListVO;
import com.team2.mbti.mbtiResult.model.MbtiResultService;
import com.team2.mbti.mbtiResult.model.MbtiResultVO;
import com.team2.mbti.mbtisurvey.model.MbtiSurveyService;
import com.team2.mbti.mbtisurvey.model.MbtiSurveyVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main/mbti")
@RequiredArgsConstructor
public class MainMbtiController {
	private static final Logger logger = LoggerFactory.getLogger(MainMbtiController.class);
	
	private final MbtiSurveyService mbtiSurveyService;
	private final MbtiResultService mbtiResultService;
	
	@RequestMapping("/")
	public String mbti() {
		logger.info("MBTI 페이지 불러오기");
		
		return "main/mbti/mbti";
	}
	
	
	@RequestMapping("/question")
	public String question(@RequestParam(defaultValue = "0") int questionTypeNo,Model model) {
		logger.info("mbti 검사 페이지, 파라미터 questionTypeNo={}",questionTypeNo);
		
		List<MbtiSurveyVO> list=mbtiSurveyService.selectByQuestionTypeNoMbtiSurvey(questionTypeNo);
		logger.info("mbti 질문지 검색 결과 list.size()={}",list.size());
		int num=(int)Math.ceil(list.size()/10);
		logger.info("num={}",num);
		
		model.addAttribute("list", list);
		model.addAttribute("num", num);
		
		return "main/mbti/question";
	}
	
	@PostMapping("/mbtiResult")
	public String mbtiResult_post(@ModelAttribute MbtiResultListVO mbtiResultListVo,HttpSession session, Model model) {
		/* int no=(int)session.getAttribute("no"); */
		int no=4;
		logger.info("mbti 결과, 파라미터 mbtiResultListVo={}",mbtiResultListVo);
		
		int cnt=mbtiResultService.insertMbtiResultList(mbtiResultListVo,no);
		logger.info("mbti 검사 결과, cnt={}",cnt);
		
		return "main/mbti/mbtiResult";
	}
	
	@GetMapping("/mbtiResult")
	public String mbtiResult_get(HttpSession session,Model model) {
		/* int no=(int)session.getAttribute("no");*/
		int no=4;
		logger.info("mbti 결과 페이지, ");
		
		int questionType1Val=0;
		int questionType2Val=0;
		int questionType3Val=0;
		int questionType4Val=0;
		int resultVal1=0;
		int resultVal2=0;
		int resultVal3=0;
		int resultVal4=0;
		int count=0;
		List<MbtiResultVO> resultList=mbtiResultService.getResultVal(no);
		
		for(int i=0;i<resultList.size();i++) {
			MbtiResultVO mbtiResultVo=resultList.get(i);
			
			if(mbtiResultVo.getQuestionTypeNo()==1) {
				questionType1Val=mbtiResultVo.getMbtiVal();
				count=mbtiSurveyService.getTotalRecordMbtiByQuestionTypeNo(mbtiResultVo);
				int n=count*4;
				resultVal1=questionType1Val/n*100;
			}
			if(mbtiResultVo.getQuestionTypeNo()==2) {
				questionType2Val=mbtiResultVo.getMbtiVal();
				count=mbtiSurveyService.getTotalRecordMbtiByQuestionTypeNo(mbtiResultVo);
				int n=count*4;
				resultVal2=questionType1Val/n*100;
			}
			if(mbtiResultVo.getQuestionTypeNo()==3) {
				questionType3Val=mbtiResultVo.getMbtiVal();
				count=mbtiSurveyService.getTotalRecordMbtiByQuestionTypeNo(mbtiResultVo);
				int n=count*4;
				resultVal3=questionType1Val/n*100;
			}
			if(mbtiResultVo.getQuestionTypeNo()==4) {
				questionType4Val=mbtiResultVo.getMbtiVal();
				count=mbtiSurveyService.getTotalRecordMbtiByQuestionTypeNo(mbtiResultVo);
				int n=count*4;
				resultVal4=questionType1Val/n*100;
			}
		}
		
		String resultMbti="";
		if(resultVal1>0) {
			resultMbti+="E";
		}else {
			resultMbti+="I";
		}
		
		if(resultVal2>0) {
			resultMbti+="N";
		}else {
			resultMbti+="S";
		}
		
		if(resultVal3>0) {
			resultMbti+="F";
		}else {
			resultMbti+="T";
		}
		
		if(resultVal4>0) {
			resultMbti+="J";
		}else {
			resultMbti+="P";
		}
		
		model.addAttribute("resultVal1", resultVal1);
		model.addAttribute("resultVal2", resultVal2);
		model.addAttribute("resultVal3", resultVal3);
		model.addAttribute("resultVal4", resultVal4);
		
		model.addAttribute("resultMbti", resultMbti);
		
		return "main/mbti/mbtiResult";
	}
}
