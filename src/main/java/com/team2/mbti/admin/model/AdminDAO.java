package com.team2.mbti.admin.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDAO {
	int checkAdminId(String adminId);
	String selectAdminPwd(String adminId);

}
