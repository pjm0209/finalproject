package com.team2.mbti.education.model;

import java.util.List;

import com.team2.mbti.common.SearchVO;

public interface EducationService {
	int insertLocation(EducationVO vo);
	List<EducationVO> selectAllLocation(SearchVO searchVo);
	int getTotalRecordLocation(SearchVO searchVo);
	
	int insertEducation(EducationVO vo);
	List<EducationVO> selectAllEducation(SearchVO searchVo);
	int getTotalRecordEducation(SearchVO searchVo);
	int deleteEducation(List<EducationVO> list);
	
	int insertTeacher(EducationVO vo);
	List<EducationVO> selectAllTeacher(SearchVO searchVo);
	int getTotalRecordTeacher(SearchVO searchVo);
}
