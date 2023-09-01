package com.team2.mbti.mbtisurvey.model;

import com.team2.mbti.common.SearchVO;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MbtiVO extends SearchVO{
	private int mbtiNo;
	private String mbtiType;
	private String definingTrait;
	private String mbtiJop;
	private String compatibility;
	private String strength;
	private String weakness;
	private String personalityTrait;		
	private String bestMbti;
	@Override
	public String toString() {
		return "MbtiVO [mbtiNo=" + mbtiNo + ", mbtiType=" + mbtiType + ", definingTrait=" + definingTrait + ", mbtiJop="
				+ mbtiJop + ", compatibility=" + compatibility + ", strength=" + strength + ", weakness=" + weakness
				+ ", personalityTrait=" + personalityTrait + ", bestMbti=" + bestMbti + ", toString()="
				+ super.toString() + "]";
	}
	
}
