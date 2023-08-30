package com.team2.mbti.message.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReceviceDmVO {
	private int receiveDmNo;
	private int sendDmNo;
	private Timestamp readDate;
	private Timestamp receiveRegdate;
	private int no;
}
