package com.team2.mbti.admin.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.mbti.common.SearchVO;

@Mapper
public interface AdminDAO {	
	int checkAdminId(String adminId);
	String selectAdminPwd(String adminId);
	List<AdminVO> selectAllManager(SearchVO vo);
	int getTotalRecordManager(SearchVO searchVo);

}
