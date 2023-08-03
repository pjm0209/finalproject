package com.team2.mbti.member.model;

public interface MemberService {
	int EXIST_ID=1; 
	int NONE_EXIST_ID=2; 

	int LOGIN_OK=1;
	int PWD_DISAGREE=2; 
	int USERID_NONE=3; 
		
	int insertMember(MemberVO vo);
	int selectCheckId(String userid);
	int loginCheck(String userid, String pwd);
	MemberVO selectByUserid(String userid);
	int updateMember(MemberVO vo);
	int updateMemberOut(String userid);

}
