package com.team2.mbti.mbtiResult.model;

import java.util.List;

public interface MbtiResultService {
	int insertMbtiResultList(MbtiResultListVO mbtiResultListVo,int no);
	List<MbtiResultVO> getResultVal(int no);
	int deleteNonMemberMbtiResult();
}
