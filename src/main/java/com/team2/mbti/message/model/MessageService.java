package com.team2.mbti.message.model;

import java.util.List;
import java.util.Map;

import com.team2.mbti.member.model.MemberVO;

public interface MessageService {
	int insertSendDmToAdmin(SendDmListVO sendDmListVo, int adminNo);
	int insertSendDmToMember(SendDmListVO sendDmListVo, int no);
	List<MemberVO> selectAllMemberbyDm();
	
	List<Map<String, Object>> messageViewById(String id);
	Map<String, Object> selectMessageViewBySendDmNo(int sendDmNo);
	int deleteSendDmBySendDmNo(SendDmListVO sendDmListVo);
}
