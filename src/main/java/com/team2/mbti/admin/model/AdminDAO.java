package com.team2.mbti.admin.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.mbti.board.model.BoardVO;
import com.team2.mbti.common.SearchVO;

@Mapper
public interface AdminDAO {	
	int checkAdminId(String adminId);
	String selectAdminPwd(String adminId);
	int selectAdminNo(String adminId);
	
	int insertManager(AdminVO vo);
	List<AdminVO> selectAllManager(SearchVO vo);
	int getTotalRecordManager(SearchVO searchVo);
}