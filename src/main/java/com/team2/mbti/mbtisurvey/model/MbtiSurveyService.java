package com.team2.mbti.mbtisurvey.model;

import java.util.List;

import com.team2.mbti.common.SearchVO;
import com.team2.mbti.mbtiResult.model.MbtiResultVO;
import com.team2.mbti.member.model.MemberVO;

public interface MbtiSurveyService {
	List<MbtiSurveyVO> selectAllMbtiSurvey(SearchVO searchVo);
	int insertMbtiSurvey(MbtiSurveyVO vo);
	MbtiSurveyVO selectByNoMbtiSurvey(int mbtiSurveyNo);
	int updateMbtiSurvey(MbtiSurveyVO vo);
	int deleteMultiMbtiSurvey(List<MbtiSurveyVO> list);
	int getTotalRecordMbti(SearchVO searchVo);
	
	List<MbtiSurveyVO> selectByQuestionTypeNoMbtiSurvey(int questionTypeNo);
	MbtiVO selectMbti(String mbtiType);
	int getTotalRecordMbtiByQuestionTypeNo(MbtiResultVO mbtiResultVo);
	List<MbtiVO> selectAllMbti();
	
	int updateMemberMbtiNoByNo(MemberVO memberVo);
}