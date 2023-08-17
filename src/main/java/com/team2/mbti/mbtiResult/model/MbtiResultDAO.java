package com.team2.mbti.mbtiResult.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MbtiResultDAO {
	int insertMbtiResult(MbtiResultVO mbtiResultVo);
}
