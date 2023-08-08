package com.team2.mbti.education.model;

import lombok.Data;

@Data
public class EducationVO {
	private int eduNo;
	private String eduName;
	private String eduCom;
	private String eduTeacher;
	private int eduPrice;
	
	//education_place
	private int epNo;
	private String epName;
	private String epZipcode;
	private String epAddress;
	private int epLatitude;
	private int epLongitude;
	private String epTel;
	
	//education_application
	private int eduAppNo;
	private int no;
	
}
