package com.team2.mbti.message.model;

import java.util.List;

import com.team2.mbti.member.model.MemberVO;

public interface MessageService {
	int insertSendDm(SendDmVO sendDmVo);
	List<MemberVO> selectAllMemberbyDm();
}
