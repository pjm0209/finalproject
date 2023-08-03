package com.team2.mbti.board.model;

import lombok.Data;

@Data
public class FaqVO {
	private int faqNo;
	private int adminNo;
	private String faqTitle;
	private String faqBody;
}