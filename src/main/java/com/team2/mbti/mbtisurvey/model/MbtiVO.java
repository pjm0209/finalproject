package com.team2.mbti.mbtisurvey.model;

import lombok.Data;

@Data
public class MbtiVO {
	private int mbtiNo;
	private String mbtiType;
	private String definingTrait;
	private String compatiblity;
	private String strength;
	private String weakness;
	private String personalityTrait;
}
