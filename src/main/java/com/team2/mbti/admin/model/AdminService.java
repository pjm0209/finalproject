package com.team2.mbti.admin.model;

import java.util.List;
import java.util.Map;

import com.team2.mbti.common.SearchVO;

public interface AdminService {
	int EXIST_ID=1; 
	int NONE_EXIST_ID=2; 

	int LOGIN_OK=1;
	int PWD_DISAGREE=2; 
	int USERID_NONE=3; 
	
	int insertManager(AdminVO adminvo); 
	List<AdminVO> selectAllManager(SearchVO vo);
	int getTotalRecordManager(SearchVO searchVo);
	String adminIdSearch(Map<String, Object> map); 
	
	int checkAdminId(String adminId);
	int loginCheck(String adminId, String adminPwd);
	int dupUserid(String userid);
	int selectAdminNo(String adminId);
	
	int deleteMultiAdmin(List<AdminVO> list);
	int updateAdmin(AdminVO adminvo);
	String selectPwd(int adminNo);
	boolean checkPwd(int no, String pwd);
	AdminVO selectByAdminNo(int adminNo);

	
}