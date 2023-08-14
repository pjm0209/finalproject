package com.team2.mbti.comment.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentVO {
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
	private int adminNo;
}