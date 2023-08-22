package com.team2.mbti.education.model;

import java.util.List;

import com.team2.mbti.common.SearchVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EducationVO extends SearchVO {
	private int eduNo;
	private String eduName;
	private String eduCom;
	private String eduTeacher;
	private int eduPrice;
	private int qty;
	private int eduPeopleNumber;
	
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
	private String eduAppFlag;
	
	//education_teacher
	private int eduTeaNo;
	private String eduTeaName;
	private String eduTeaId;
	private String eduTeaPwd;
	private String eduTeaEmail;
	private String eduTeaTel;
	
	private String name;

	@Override
	public String toString() {
		return "EducationVO [eduNo=" + eduNo + ", eduName=" + eduName + ", eduCom=" + eduCom + ", eduTeacher="
				+ eduTeacher + ", eduPrice=" + eduPrice + ", qty=" + qty + ", eduPeopleNumber=" + eduPeopleNumber
				+ ", epNo=" + epNo + ", epName=" + epName + ", epZipcode=" + epZipcode + ", epAddress=" + epAddress
				+ ", epLatitude=" + epLatitude + ", epLongitude=" + epLongitude + ", epTel=" + epTel + ", eduAppNo="
				+ eduAppNo + ", no=" + no + ", eduAppFlag=" + eduAppFlag + ", eduTeaNo=" + eduTeaNo + ", eduTeaName="
				+ eduTeaName + ", eduTeaId=" + eduTeaId + ", eduTeaPwd=" + eduTeaPwd + ", eduTeaEmail=" + eduTeaEmail
				+ ", eduTeaTel=" + eduTeaTel + ", name=" + name + ", toString()=" + super.toString() + "]";
	}
}