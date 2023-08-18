package com.team2.mbti.mbtiResult.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MbtiResultVO {
	private int mbtiResultNo;
	private int no;
	private int mbtiVal;
	private Timestamp mbtiResultRegdate;
	private int mbtiSurveyNo;
}
