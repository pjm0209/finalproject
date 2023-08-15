package com.team2.mbti.mbtisurvey.model;

import com.team2.mbti.common.SearchVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MbtiSurveyVO extends SearchVO {
	private int mbtiServeyNo;
	private int questionTypeNo;
	private int questionCategoryNo;
    private String question;
	@Override
	public String toString() {
		return "MbtiSurveyVO [mbtiServeyNo=" + mbtiServeyNo + ", questionTypeNo=" + questionTypeNo
				+ ", questionCategoryNo=" + questionCategoryNo + ", question=" + question + ", toString()="
				+ super.toString() + "]";
	}
    
}