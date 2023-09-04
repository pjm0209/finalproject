package com.team2.mbti.message.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SendDmVO {
	private int sendDmNo;
	private int no;
	private int adminNo;
	private int receiveNo;
	private String sendBody;
	private Timestamp sendRegdate;
}
