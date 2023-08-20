package com.team2.mbti.mbtiResult.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MbtiResultDAO {
	int insertMbtiResult(MbtiResultVO mbtiResultVo);
	int deleteMbtiResultByQuestionTypeNo(MbtiResultVO mbtiResultVo);
	int getMbtiResultCount(MbtiResultVO mbtiResultVo);
	List<MbtiResultVO> getResultVal(int no);
}
