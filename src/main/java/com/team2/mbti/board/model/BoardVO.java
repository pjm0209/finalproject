package com.team2.mbti.board.model;

import java.sql.Timestamp;

import com.team2.mbti.common.SearchVO;

import lombok.Data;

@Data
public class BoardVO extends SearchVO {
	private int boardNo;
	private int boardFormNo;
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