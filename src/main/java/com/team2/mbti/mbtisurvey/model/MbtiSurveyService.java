package com.team2.mbti.mbtisurvey.model;

import java.util.List;

public interface MbtiSurveyService {
	List<MbtiSurveyVO> selectAllMbtiSurvey();
	int insertMbtiSurvey(MbtiSurveyVO vo);
	MbtiSurveyVO selectByNoMbtiSurvey(int mbtiServeyNo);
	int updateMbtiSurvey(MbtiSurveyVO vo);
}
