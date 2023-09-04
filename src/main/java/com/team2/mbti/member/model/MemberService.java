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
	
	int updateMember(MemberVO vo); //회원정보수정
	int updateMemberOut(String userid); //회원탈퇴
	
	MemberVO getMemberByNameAndEmail(String name, String email); // 아이디찾기 - 이름, 이메일
	MemberVO getMemberByNameAndHp(String name, String hp); //아이디찾기 - 이름, 전화번호
	
	int emailCheck(String email, int no); //비번찾기 메일 확인
	int findInfoCheck(MemberVO membervo); //비밀번호 찾을때 이메일,회원번호 개수 확인
	int findPwd(MemberVO membervo); //비번 찾기 비번 변경
	
	String pwdCheck(String userid); //비밀번호 확인
	int updatePassword(MemberVO membervo); //비밀번호 변경


}
