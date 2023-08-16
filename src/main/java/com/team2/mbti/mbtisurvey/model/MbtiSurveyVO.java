package com.team2.mbti.mbtisurvey.model;

import com.team2.mbti.common.SearchVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MbtiSurveyVO extends SearchVO {
	private int mbtiSurveyNo;
	private int questionTypeNo;
	private int questionCategoryNo;
    private String question;
	@Override
	public String toString() {
		return "MbtiSurveyVO [mbtiSurveyNo=" + mbtiSurveyNo + ", questionTypeNo=" + questionTypeNo
				+ ", questionCategoryNo=" + questionCategoryNo + ", question=" + question + ", toString()="
				+ super.toString() + "]";
	}
    
}