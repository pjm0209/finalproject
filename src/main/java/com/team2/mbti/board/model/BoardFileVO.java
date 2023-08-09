package com.team2.mbti.board.model;

import lombok.Data;

@Data
public class BoardFileVO {
	private int fileNo;
	private int boardNo;
	private String fileName;
	private long fileSize;
	private String originalFileName;
}