package com.team2.mbti.message.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.mbti.member.model.MemberVO;

@Mapper
public interface MessageDao {
	int insertSendDm(SendDmVO sendDmVo);
	List<MemberVO> selectAllMemberbyDm();
}
