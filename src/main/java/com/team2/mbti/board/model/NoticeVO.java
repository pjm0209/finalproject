package com.team2.mbti.board.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeVO {
	private int noitceNo;
	private int adminNo;
	private String noticeTitle;
	private String noticeBody;
	private Timestamp noticeRegdate;
	private int noticeReadCount;
}