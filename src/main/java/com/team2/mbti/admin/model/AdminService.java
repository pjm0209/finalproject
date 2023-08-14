package com.team2.mbti.admin.model;

import java.util.List;

import com.team2.mbti.common.SearchVO;

public interface AdminService {
	int loginCheck(String adminId, String adminPwd);
	int dupUserid(String userid);
	List<AdminVO> selectAllManager(SearchVO vo);
	int getTotalRecordManager(SearchVO searchVo);
	int selectAdminNo(String adminId);
	int insertManager(AdminVO vo); //관리자 추가
}