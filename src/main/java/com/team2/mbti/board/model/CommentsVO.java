package com.team2.mbti.board.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentsVO {
	private int commentsNo;
	private int boardNo;
	private int no;
	private Timestamp commentsRegdate;
	private String commentsBody;
	private int commentsGroupNo;
	private int commentsStep;
	private int commentsSort;
	private int commentsRcmdCount;
	private String commentsDelFlag;
}