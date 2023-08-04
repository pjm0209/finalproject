package com.team2.mbti.mbtisurvey.model;

import lombok.Data;

@Data
public class MbtiSurveyVO {
	private int mbtiServeyNo;
	private int questionTypeNo;
	private int questionCategoryNo;
    private String question;
}