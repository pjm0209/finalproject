package com.team2.mbti.message.model;

import java.util.List;

import com.team2.mbti.member.model.MemberVO;

public interface MessageService {
	int insertSendDmToAdmin(SendDmListVO sendDmListVo, int adminNo);
	int insertSendDmToMember(SendDmListVO sendDmListVo, int no);
	List<MemberVO> selectAllMemberbyDm();
}
