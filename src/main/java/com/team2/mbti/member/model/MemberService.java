package com.team2.mbti.member.model;

import java.util.List;
import java.util.Map;

import com.team2.mbti.common.SearchVO;

import jakarta.servlet.http.HttpServletResponse;

public interface MemberService {
	int EXIST_ID=1; 
	int NONE_EXIST_ID=2; 

	int LOGIN_OK=1;
	int PWD_DISAGREE=2; 
	int USERID_NONE=3; 
		
	int insertMember(MemberVO membervo); 
	
	List<MemberVO> selectAllMember(SearchVO vo);
	int getTotalRecordMember(SearchVO searchVo);
	String memberIdSearch(Map<String, Object> map);
	
	int selectCheckId(String userid);	
	String selectPwd(String userid); 
	int loginCheck(String userid, String pwd);
	
	MemberVO selectByUserid(String userid);
	
	int deleteMultiMember(List<MemberVO> list);
	
	public void sendEmail(MemberVO vo, String div) throws Exception; //이메일 발송

	public void findPwd(HttpServletResponse resp, MemberVO vo) throws Exception; //비밀번호찾기
	
	

}
