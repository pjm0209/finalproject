package com.team2.mbti.board.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QnaVO {
	private int qnaNo;
	private String qnaCategory;
	private String qnaTitle;
	private String qnaBody;
	private String qnaReply;
	private String disclosure;
	private Timestamp qnaRegdate;
	private int no;
}