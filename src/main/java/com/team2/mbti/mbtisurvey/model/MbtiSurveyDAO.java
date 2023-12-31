package com.team2.mbti.mbtisurvey.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team2.mbti.common.SearchVO;
import com.team2.mbti.mbtiResult.model.MbtiResultVO;
import com.team2.mbti.member.model.MemberVO;

@Mapper
public interface MbtiSurveyDAO {
	List<MbtiSurveyVO> selectAllMbtiSurvey(SearchVO searchVo);
	int insertMbtiSurvey(MbtiSurveyVO vo);
	MbtiSurveyVO selectByNoMbtiSurvey(int mbtiSurveyNo);
	int updateMbtiSurvey(MbtiSurveyVO vo);
	int deleteMbtiSurvey(MbtiSurveyVO vo);
	int getTotalRecordMbti(SearchVO searchVo);
	
	List<MbtiSurveyVO> selectByQuestionTypeNoMbtiSurvey(int questionTypeNo);
	MbtiVO selectMbti(String mbtiType);
	int getTotalRecordMbtiByQuestionTypeNo(MbtiResultVO mbtiResultVo);
	List<MbtiVO> selectAllMbti();
	int updateMemberMbtiNoByNo(MemberVO memberVo);
	List<Map<String, Object>> selectMbtiStatisticsView(SearchVO searchVo);
	int getTotalRecordMbtiStatisticsView(SearchVO searchVo);
	
	List<Map<String, Object>>selectMbtiStatistics();
	int deleteMbtiResult(MbtiResultVO mbtiResultVo);
	
	//정식검사시 매출테이블 인서트
	int insertSalesByMbti();
}