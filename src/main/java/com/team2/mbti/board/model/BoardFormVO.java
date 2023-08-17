package com.team2.mbti.board.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardFormVO {
	private int boardFormNo;
	private String boardFormName;
	private String boardFormIntro;
	private String boardFileAddFlag;
	private String commentFlag;
	private String boardFlag;
	private String firstAdminId;
	private Timestamp firstRegdate;
	private String lastEditAdminId;
	private Timestamp lastRegdate;
	private String boardSecretFlag;
}