package com.team2.mbti.mbtisurvey.model;

import java.util.List;

import com.team2.mbti.common.SearchVO;

public interface MbtiSurveyService {
	List<MbtiSurveyVO> selectAllMbtiSurvey(SearchVO searchVo);
	int insertMbtiSurvey(MbtiSurveyVO vo);
	MbtiSurveyVO selectByNoMbtiSurvey(int mbtiSurveyNo);
	int updateMbtiSurvey(MbtiSurveyVO vo);
	int deleteMultiMbtiSurvey(List<MbtiSurveyVO> list);
	int getTotalRecordMbti(SearchVO searchVo);
	
	List<MbtiSurveyVO> selectByQuestionTypeNoMbtiSurvey(int questionTypeNo);
}
