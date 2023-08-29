package com.team2.mbti.education.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.mbti.common.SearchVO;

@Mapper
public interface EducationDAO {
	int insertLocation(EducationVO vo);
	List<EducationVO> selectAllLocation(EducationVO vo);
	int getTotalRecordLocation(EducationVO vo);
	int updateLocation(EducationVO vo);
	int deleteLocation(int epNo);
	EducationVO selectByNoLocation(int epNo);
	
	int insertEducation(EducationVO vo);
	List<EducationVO> selectAllEducation(EducationVO vo);
	int getTotalRecordEducation(EducationVO vo);
	int updateEducation(EducationVO vo);
	int deleteEducation(int eduNo);
	EducationVO selectByNoEducation(int eduNo);
	List<EducationVO> getTeaName();
	List<EducationVO> getEpName();
	
	int insertTeacher(EducationVO vo);
	List<EducationVO> selectAllTeacher(EducationVO vo);
	int getTotalRecordTeacher(EducationVO vo);
	int updateTeacher(EducationVO vo);
	int deleteTeacher(int eduTeaNo);
	EducationVO selectByNoTeacher(int eduTeaNo);
	
	int insertApply(EducationVO vo);
	List<EducationVO> selectAllApplicant(EducationVO vo);
	int getTotalRecordApplicant(EducationVO vo);
	int deleteApplicant(int eduAppNo);
	int updateApplicant(int eduAppNo);
	
	List<EducationVO> selectAllList(EducationVO vo);
	
	List<EducationVO> selectAllLocName();
}
