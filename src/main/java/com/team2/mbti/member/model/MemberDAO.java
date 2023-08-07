package com.team2.mbti.member.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.mbti.common.SearchVO;
import com.team2.mbti.mbtisurvey.model.MbtiSurveyVO;

@Mapper
public interface MemberDAO {
	int insertMember(MemberVO vo);
	List<MemberVO> selectAllMember(SearchVO vo);
	int getTotalRecordMember(SearchVO searchVo);
	MemberVO selectByNoMember(int no);

}
