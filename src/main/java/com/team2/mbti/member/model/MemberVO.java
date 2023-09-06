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
	private String zipcode;
	private String address;
	private String addressDetail;
	private Timestamp regdate;
	private String activatable;
	private Timestamp outdate;
	private int mbtiNo;
	
	@Override
	public String toString() {
		return "MemberVO [no=" + no + ", userid=" + userid + ", pwd=" + pwd + ", name=" + name + ", hp=" + hp
				+ ", email=" + email + ", zipcode=" + zipcode + ", address=" + address + ", addressDetail="
				+ addressDetail + ", regdate=" + regdate + ", activatable=" + activatable + ", outdate=" + outdate
				+ ", mbtiNo=" + mbtiNo + ", toString()=" + super.toString() + "]";
	}
	
	
}
