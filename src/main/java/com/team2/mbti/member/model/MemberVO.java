package com.team2.mbti.member.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
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
}
