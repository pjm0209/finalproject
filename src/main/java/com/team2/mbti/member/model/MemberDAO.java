package com.team2.mbti.member.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team2.mbti.common.SearchVO;

@Mapper
public interface MemberDAO {
	int insertMember(MemberVO membervo); //회원등록
	List<MemberVO> selectAllMember(SearchVO vo); //회원리스트
	int getTotalRecordMember(SearchVO searchVo); //총레코드수
	String memberIdSearch(Map<String, Object> map); //회원검색
	
	int selectCheckId(String userid); //아이디확인
	String selectPwd(String userid); //비번확인
	
	MemberVO selectByUserid(String userid);
		
	int deleteMultiMember(int adminNo); //관리자 - 회원삭제
	
	int updateMember(MemberVO vo); //회원정보수정
	int updateMemberOut(String userid); //회원탈퇴
	
	MemberVO getMemberByNameAndEmail(String name, String email); // 아이디찾기 - 이름,이메일
	MemberVO getMemberByNameAndHp(String name, String hp); //아이디찾기 - 이름, 전화번호
	
	int updateFindPwd(MemberVO membervo) throws Exception; //회원 비번 찾기
	void sendEmail(MemberVO membervo, String div); //비번찾기 메일 보내기
	String selectEmail(int no); //비밀번호 찾을때 이메일 확인
	int emailCheck(String email, int no); //비번찾기 메일 확인
	int findInfoCheck(MemberVO membervo); //비밀번호 찾을때 이메일,회원번호 개수 확인
	int findPwd(MemberVO membervo); //비번 찾기 비번 변경
	
	String pwdCheck(String userid); //비밀번호 확인
	int updatePassword(MemberVO membervo); //비밀번호 변경

	
	
	
	
	
			
}
