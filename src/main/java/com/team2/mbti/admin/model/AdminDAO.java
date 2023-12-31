package com.team2.mbti.admin.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team2.mbti.common.SearchVO;

@Mapper
public interface AdminDAO {	
	int insertManager(AdminVO adminvo);
	List<AdminVO> selectAllManager(SearchVO vo);
	int getTotalRecordManager(SearchVO searchVo);
	String adminIdSearch(Map<String, Object> map); 
	
	int checkAdminId(String adminId);
	String selectAdminPwd(String adminId);
	int selectAdminNo(String adminId);
	
	int deleteMultiAdmin(int adminNo);
	int updateAdmin(AdminVO adminvo);
	String selectPwd(int adminNo); 
	AdminVO selectByAdminNo(int adminNo);
	
}