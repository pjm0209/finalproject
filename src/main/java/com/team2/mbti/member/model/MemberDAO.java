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
		
	int deleteMultiMember(int adminNo);
	
	MemberVO readMember(String userid); //회원읽기
	public int updatePw(MemberVO vo) throws Exception;//비밀번호변경
	
	
	
	
		
}
