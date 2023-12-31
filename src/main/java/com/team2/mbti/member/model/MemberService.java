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
	
	int EMAIL_OK=2;
	int EMAIL_DISAGREE=3;
		
	int insertMember(MemberVO membervo); 
	
	List<MemberVO> selectAllMember(SearchVO vo);
	int getTotalRecordMember(SearchVO searchVo);
	String memberIdSearch(Map<String, Object> map);
	
	int selectCheckId(String userid);	
	String selectPwd(String userid); 
	int loginCheck(String userid, String pwd);
	
	MemberVO selectByUserid(String userid);
	
	int deleteMultiMember(List<MemberVO> list);
	
	int updateMember(MemberVO vo); //회원정보수정
	int updateMemberOut(String userid); //회원탈퇴
	
	MemberVO getMemberByNameAndEmail(String name, String email); // 아이디찾기 - 이름, 이메일
	MemberVO getMemberByNameAndHp(String name, String hp); //아이디찾기 - 이름, 전화번호
	
	int emailCheck(Map<String, Object>map); //비번찾기 메일 확인

	String pwdCheck(String userid); //비밀번호 확인
	int updatePassword(MemberVO membervo); //비밀번호 변경
	
	int getTotalMember(MemberVO membervo); //총 회원수 확인
	int getTodayMember(MemberVO membervo); //오늘 가입자수 확인
	int getWeekMember(MemberVO membervo); //이번주 가입자 수 확인


}
