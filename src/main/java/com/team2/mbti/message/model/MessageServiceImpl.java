package com.team2.mbti.message.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MessageServiceImpl implements MessageService {
	private final MessageDao messageDao;
	
	@Override
	public int insertSendDm(SendDmVO sendDmVo) {
		return messageDao.insertSendDm(sendDmVo);
	}
	
}
