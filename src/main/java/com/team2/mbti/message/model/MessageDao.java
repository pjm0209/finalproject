package com.team2.mbti.message.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team2.mbti.member.model.MemberVO;

@Mapper
public interface MessageDao {
	int insertSendDmToAdmin(SendDmVO sendDmVo);
	int insertReceiveDm(ReceiveDmVO receiveDmVo);
	int insertSendDmToMember(SendDmVO sendDmVo);
	List<MemberVO> selectAllMemberbyDm();
	
	List<Map<String, Object>> messageViewById(String id);
	Map<String, Object> selectMessageViewBySendDmNo(int sendDmNo);
	
	int deleteSendDmBySendDmNo(int sendDmNo);
}
