package com.team2.mbti.admin.model;

import java.util.List;
import java.util.Map;

import com.team2.mbti.common.SearchVO;

public interface AdminService {
	
	int insertManager(AdminVO adminvo); 
	List<AdminVO> selectAllManager(SearchVO vo);
	int getTotalRecordManager(SearchVO searchVo);
	String adminIdSearch(Map<String, Object> map); 
	
	int checkAdminId(String adminId);
	int loginCheck(String adminId, String adminPwd);
	int dupUserid(String userid);
	int selectAdminNo(String adminId);
	
	int deleteMultiAdmin(List<AdminVO> list);
}