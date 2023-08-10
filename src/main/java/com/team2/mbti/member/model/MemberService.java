package com.team2.mbti.member.model;

import java.util.List;

import com.team2.mbti.common.SearchVO;

public interface MemberService {
	int EXIST_ID=1; 
	int NONE_EXIST_ID=2; 

	int LOGIN_OK=1;
	int PWD_DISAGREE=2; 
	int USERID_NONE=3; 
		
	int insertMember(MemberVO vo);
	List<MemberVO> selectAllMember(SearchVO vo);
	int getTotalRecordMember(SearchVO searchVo);
	MemberVO selectByNoMember(int no);
	int selectCheckId(String userid);

	

}
