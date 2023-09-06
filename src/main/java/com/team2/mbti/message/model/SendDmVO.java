package com.team2.mbti.message.model;

import java.sql.Timestamp;

import com.team2.mbti.common.SearchVO;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class SendDmVO extends SearchVO{
	private int sendDmNo;
	private int no;
	private String sendBody;
	private Timestamp sendRegdate;
	private int receiveNo;
	private int adminNo;
	private String receiveManagerFlag;
	
	@Override
	public String toString() {
		return "SendDmVO [sendDmNo=" + sendDmNo + ", no=" + no + ", sendBody=" + sendBody + ", sendRegdate="
				+ sendRegdate + ", receiveNo=" + receiveNo + ", adminNo=" + adminNo + ", receiveManagerFlag="
				+ receiveManagerFlag + ", toString()=" + super.toString() + "]";
	}
	
}
