package com.team2.mbti.mbtisurvey.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MbtiSurveyDAO {
	List<MbtiSurveyVO> selectAllMbtiSurvey();
	int insertMbtiSurvey(MbtiSurveyVO vo);
	MbtiSurveyVO selectByNoMbtiSurvey(int mbtiServeyNo);
	int updateMbtiSurvey(MbtiSurveyVO vo);
	int deleteMbtiSurvey(MbtiSurveyVO vo);
}
