package com.team2.mbti.message.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReceiveDmVO {
	private int receiveDmNo;
	private int sendDmNo;
	private Timestamp readDate;
	private Timestamp receiveRegdate;
}
