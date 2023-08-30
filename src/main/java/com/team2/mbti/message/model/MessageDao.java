package com.team2.mbti.message.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MessageDao {
	int insertSendDm(SendDmVO sendDmVo);
}
