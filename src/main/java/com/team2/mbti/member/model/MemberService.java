package com.team2.mbti.member.model;

import java.util.List;
import java.util.Map;

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
	String memberIdSearch(Map<String, Object> map);
	
	int selectCheckId(String userid);	
	int deleteMember(int no);
	int loginCheck(String userid, String pwd);
	String selectPwd(String userid); //비번확인
	MemberVO selectByUserid(String userid);
	

}
