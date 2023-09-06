package com.team2.mbti.main.mbti.controller;

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

import com.team2.mbti.mbtiResult.model.MbtiResultListVO;
import com.team2.mbti.mbtiResult.model.MbtiResultService;
import com.team2.mbti.mbtiResult.model.MbtiResultVO;
import com.team2.mbti.mbtisurvey.model.MbtiSurveyService;
import com.team2.mbti.mbtisurvey.model.MbtiSurveyVO;
import com.team2.mbti.mbtisurvey.model.MbtiVO;
import com.team2.mbti.member.model.MemberVO;

import jakarta.servlet.http.HttpSession;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main/mbti")
@RequiredArgsConstructor
public class MainMbtiController {
	private static final Logger logger = LoggerFactory.getLogger(MainMbtiController.class);
	
	private final MbtiSurveyService mbtiSurveyService;
	private final MbtiResultService mbtiResultService;
	
	@RequestMapping("/mbti")
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
		int no=(int)session.getAttribute("no");
		logger.info("mbti 결과, 파라미터 mbtiResultListVo={},no={}",mbtiResultListVo,no);
		
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
		
		int resultI=0;
		int resultE=0;
		int resultS=0;
		int resultN=0;
		int resultT=0;
		int resultF=0;
		int resultP=0;
		int resultJ=0;
		
		String resultMbti="";
		if(iVal>eVal) {
			resultMbti+="I";
			resultI=(int)(iVal/(iVal+eVal)*100);
			resultE=100-resultI;
		}else {
			resultMbti+="E";
			resultE=(int)(eVal/(iVal+eVal)*100);
			resultI=100-resultE;
		}
		
		if(sVal>nVal) {
			resultMbti+="S";
			resultS=(int)(sVal/(sVal+nVal)*100);
			resultN=100-resultS;
		}else {
			resultMbti+="N";
			resultN=(int)(nVal/(sVal+nVal)*100);
			resultS=100-resultN;
		}
		
		if(tVal>fVal) {
			resultMbti+="T";
			resultT=(int)(tVal/(tVal+fVal)*100);
			resultF=100-resultT;
		}else {
			resultMbti+="F";
			resultF=(int)(fVal/(tVal+fVal)*100);
			resultT=100-resultF;
		}
		
		if(pVal>jVal) {
			resultMbti+="P";
			resultP=(int)(pVal/(pVal+jVal)*100);
			resultJ=100-resultP;
		}else {
			resultMbti+="J";
			resultJ=(int)(jVal/(pVal+jVal)*100);
			resultP=100-resultJ;
		}
		
		MbtiVO mbtiVo=mbtiSurveyService.selectMbti(resultMbti);
		logger.info("MBTI 검사한 결과 조회, mbtiVo={}",mbtiVo);
		
		MemberVO memberVo= new MemberVO();
		memberVo.setNo(no);
		memberVo.setMbtiNo(mbtiVo.getMbtiNo());
		
		int cnt2=mbtiSurveyService.updateMemberMbtiNoByNo(memberVo);
		logger.info("MBTI 결과 회원정보 입력(수정) 결과 cnt2={}",cnt2);
		
		model.addAttribute("resultMbti", resultMbti);
		model.addAttribute("resultI", resultI);
		model.addAttribute("resultE", resultE);
		model.addAttribute("resultS", resultS);
		model.addAttribute("resultN", resultN);
		model.addAttribute("resultT", resultT);
		model.addAttribute("resultF", resultF);
		model.addAttribute("resultP", resultP);
		model.addAttribute("resultJ", resultJ);
		model.addAttribute("mbtiVo", mbtiVo);
		
		return "main/mbti/mbtiResult";
	}
	
	/** 임시 메서드*/
	@GetMapping("/mbtiResult")
	public String mbtiResult_get(@RequestParam String mbtiType, Model model) {
		logger.info("mbti 결과 페이지, 파라미터 mbtiType={}",mbtiType);
		
		MbtiVO mbtiVo=mbtiSurveyService.selectMbti(mbtiType);

		model.addAttribute("resultMbti", mbtiType);
		model.addAttribute("resultI", "");
		model.addAttribute("resultE", "");
		model.addAttribute("resultS", "");
		model.addAttribute("resultN", "");
		model.addAttribute("resultT", "");
		model.addAttribute("resultF", "");
		model.addAttribute("resultP", "");
		model.addAttribute("resultJ", "");
		model.addAttribute("mbtiVo", mbtiVo);

		return "main/mbti/mbtiResult";
	}
	
	@RequestMapping("/mbtiStatistics")
	public String mbtiStatistics(Model model) {
		logger.info("통계 페이지 보여주기");
		
		List<Map<String, Object>> list=mbtiSurveyService.selectMbtiStatistics();
		logger.info("통계 파이차트 결과 list.size()={}",list.size());
		
		model.addAttribute("list", list);
		
		return "main/mbti/mbtiStatistics";
	}
	


}
