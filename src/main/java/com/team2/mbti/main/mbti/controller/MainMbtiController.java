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
		
		int questionCategory1Val=0;
		int questionCategory2Val=0;
		int questionCategory3Val=0;
		int questionCategory4Val=0;
		int questionCategory5Val=0;
		int questionCategory6Val=0;
		int questionCategory7Val=0;
		int questionCategory8Val=0;
		double iVal=0;
		double eVal=0;
		double sVal=0;
		double nVal=0;
		double tVal=0;
		double fVal=0;
		double pVal=0;
		double jVal=0;
		int count=0;
		List<MbtiResultVO> resultList=mbtiResultService.getResultVal(no);
		logger.info("mbti 검사 합산 결과, resultList.size()={}",resultList.size());
		
		for(int i=0;i<resultList.size();i++) {
			MbtiResultVO mbtiResultVo=resultList.get(i);
			
			if(mbtiResultVo.getQuestionCategoryNo()==1) {
				questionCategory1Val=mbtiResultVo.getMbtiVal();
				count=mbtiSurveyService.getTotalRecordMbtiByQuestionTypeNo(mbtiResultVo);
				iVal= questionCategory1Val/count;
				logger.info("1count={},iVal={}",count,iVal);
			}
			
			if(mbtiResultVo.getQuestionCategoryNo()==2) {
				questionCategory2Val=mbtiResultVo.getMbtiVal();
				count=mbtiSurveyService.getTotalRecordMbtiByQuestionTypeNo(mbtiResultVo);
				eVal=questionCategory2Val/count;
				logger.info("2count={},eVal={}",count,eVal);
			}
			
			if(mbtiResultVo.getQuestionCategoryNo()==3) {
				questionCategory3Val=mbtiResultVo.getMbtiVal();
				count=mbtiSurveyService.getTotalRecordMbtiByQuestionTypeNo(mbtiResultVo);
				sVal=questionCategory3Val/count;
			}
			
			if(mbtiResultVo.getQuestionCategoryNo()==4) {
				questionCategory4Val=mbtiResultVo.getMbtiVal();
				count=mbtiSurveyService.getTotalRecordMbtiByQuestionTypeNo(mbtiResultVo);
				nVal=questionCategory4Val/count;
			}
			
			if(mbtiResultVo.getQuestionCategoryNo()==5) {
				questionCategory5Val=mbtiResultVo.getMbtiVal();
				count=mbtiSurveyService.getTotalRecordMbtiByQuestionTypeNo(mbtiResultVo);
				tVal=questionCategory5Val/count;
			}
			
			if(mbtiResultVo.getQuestionCategoryNo()==6) {
				questionCategory6Val=mbtiResultVo.getMbtiVal();
				count=mbtiSurveyService.getTotalRecordMbtiByQuestionTypeNo(mbtiResultVo);
				fVal=questionCategory6Val/count;
			}
			
			if(mbtiResultVo.getQuestionCategoryNo()==7) {
				questionCategory7Val=mbtiResultVo.getMbtiVal();
				count=mbtiSurveyService.getTotalRecordMbtiByQuestionTypeNo(mbtiResultVo);
				pVal=questionCategory7Val/count;
			}
			
			if(mbtiResultVo.getQuestionCategoryNo()==8) {
				questionCategory8Val=mbtiResultVo.getMbtiVal();
				count=mbtiSurveyService.getTotalRecordMbtiByQuestionTypeNo(mbtiResultVo);
				jVal=questionCategory8Val/count;
			}
		}
		
		int resultIE=0;
		int resultSN=0;
		int resultTF=0;
		int resultPJ=0;
		
		String resultMbti="";
		if(iVal>eVal) {
			resultMbti+="I";
			resultIE=(int)(iVal/(iVal+eVal)*100);
		}else {
			resultMbti+="E";
			resultIE=(int)(eVal/(iVal+eVal)*100);
		}
		
		if(sVal>nVal) {
			resultMbti+="S";
			resultSN=(int)(sVal/(sVal+nVal)*100);
		}else {
			resultMbti+="N";
			resultSN=(int)(nVal/(sVal+nVal)*100);
		}
		
		if(tVal>fVal) {
			resultMbti+="T";
			resultTF=(int)(tVal/(tVal+fVal)*100);
		}else {
			resultMbti+="F";
			resultTF=(int)(fVal/(tVal+fVal)*100);
		}
		
		if(pVal>jVal) {
			resultMbti+="P";
			resultPJ=(int)(pVal/(pVal+jVal)*100);
		}else {
			resultMbti+="J";
			resultPJ=(int)(jVal/(pVal+jVal)*100);
		}
		logger.info("resultMbti={},resultIE={},resultSN={},resultTF={},resultPJ={}",resultMbti,resultIE,resultSN,resultTF,resultPJ);
		model.addAttribute("resultMbti", resultMbti);
		model.addAttribute("resultIE", resultIE);
		model.addAttribute("resultSN", resultSN);
		model.addAttribute("resultTF", resultTF);
		model.addAttribute("resultPJ", resultPJ);

		return "main/mbti/mbtiResult";
	}
}
