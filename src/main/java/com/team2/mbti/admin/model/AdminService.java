package com.team2.mbti.admin.model;

public interface AdminService {
	int loginCheck(String adminId, String adminPwd);
	int dupUserid(String userid);
}
