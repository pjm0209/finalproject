package com.team2.mbti.message.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.team2.mbti.member.model.MemberVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MessageServiceImpl implements MessageService {
	private final MessageDao messageDao;
	
	@Override
	public int insertSendDm(SendDmVO sendDmVo) {
		return messageDao.insertSendDm(sendDmVo);
	}

	@Override
	public List<MemberVO> selectAllMemberbyDm() {
		return messageDao.selectAllMemberbyDm();
	}
	
}
