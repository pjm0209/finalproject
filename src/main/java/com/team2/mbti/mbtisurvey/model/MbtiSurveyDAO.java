package com.team2.mbti.mbtisurvey.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.mbti.common.SearchVO;

@Mapper
public interface MbtiSurveyDAO {
	List<MbtiSurveyVO> selectAllMbtiSurvey(SearchVO searchVo);
	int insertMbtiSurvey(MbtiSurveyVO vo);
	MbtiSurveyVO selectByNoMbtiSurvey(int mbtiServeyNo);
	int updateMbtiSurvey(MbtiSurveyVO vo);
	int deleteMbtiSurvey(MbtiSurveyVO vo);
	int getTotalRecordMbti(SearchVO searchVo);
	
	List<MbtiSurveyVO> selectByQuestionTypeNoMbtiSurvey(int questionTypeNo);
}
