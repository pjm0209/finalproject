package com.team2.mbti.board.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO {
	private int boardNo;
	private int boardFromNo;
	private String boardTitle;
	private String boardBody;
	private int no;
	private Timestamp boardRegdate;
	private int boardReadcount;
	private int rcmdCount;
	private int boardGroupNo;
	private int boardStep;
	private int boardSort;
	private String boardDelFlag;
	private int mbtiNo;
}