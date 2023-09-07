package com.team2.mbti.member.model;

import java.sql.Timestamp;

import com.team2.mbti.common.SearchVO;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MemberVO extends SearchVO {
	private int no;
	private String userid;
	private String pwd;
	private String name;
	private String hp;
	private String email;
	private String email1;
	private String email2;
	private String email3;
	private String zipcode;
	private String address;
	private String addressDetail;
	private Timestamp regdate;
	private String activatable;
	private Timestamp outdate;
	private int mbtiNo;
	private String kakaoIdFlag;
	
	@Override
	public String toString() {
		return "MemberVO [no=" + no + ", userid=" + userid + ", pwd=" + pwd + ", name=" + name + ", hp=" + hp
				+ ", email=" + email + ", email1=" + email1 + ", email2=" + email2 + ", email3=" + email3 + ", zipcode="
				+ zipcode + ", address=" + address + ", addressDetail=" + addressDetail + ", regdate=" + regdate
				+ ", activatable=" + activatable + ", outdate=" + outdate + ", mbtiNo=" + mbtiNo + ", kakaoIdFlag="
				+ kakaoIdFlag + ", toString()=" + super.toString() + "]";
	}
	
}
