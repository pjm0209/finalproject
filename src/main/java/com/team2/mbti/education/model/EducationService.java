package com.team2.mbti.education.model;

import java.util.List;

import com.team2.mbti.common.SearchVO;

public interface EducationService {
	int insertLocation(EducationVO vo);
	List<EducationVO> selectAllLocation(EducationVO vo);
	int getTotalRecordLocation(EducationVO vo);
	int deleteLocation(List<EducationVO> list);
	
	int insertEducation(EducationVO vo);
	List<EducationVO> selectAllEducation(EducationVO vo);
	int getTotalRecordEducation(EducationVO vo);
	int updateEducation(EducationVO vo);
	int deleteEducation(List<EducationVO> list);
	EducationVO selectByNoEducation(int eduNo);
	List<EducationVO> getTeaName();
	List<EducationVO> getEpName();
	
	int insertTeacher(EducationVO vo);
	List<EducationVO> selectAllTeacher(EducationVO vo);
	int getTotalRecordTeacher(EducationVO vo);
	int deleteTeacher(List<EducationVO> list);
	
	List<EducationVO> selectAllApplicant(EducationVO vo);
	int getTotalRecordApplicant(EducationVO vo);
	int deleteApplicant(List<EducationVO> list);
	int updateApplicant(List<EducationVO> list);
	
}
