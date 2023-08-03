package com.team2.mbti.member.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {
	int insertMember(MemberVO vo);
	int selectCheckId(String userid);
	String selectPwd(String userid);
	MemberVO selectByUserid(String userid);
	int updateMember(MemberVO vo);
	int updateMemberOut(String userid);

}
