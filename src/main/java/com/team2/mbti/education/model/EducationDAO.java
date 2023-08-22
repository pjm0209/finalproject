package com.team2.mbti.education.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.mbti.common.SearchVO;

@Mapper
public interface EducationDAO {
	int insertLocation(EducationVO vo);
	List<EducationVO> selectAllLocation(SearchVO searchVo);
	int getTotalRecordLocation(SearchVO searchVo);
	int deleteLocation(int epNo);
	
	int insertEducation(EducationVO vo);
	List<EducationVO> selectAllEducation(SearchVO searchVo);
	int getTotalRecordEducation(SearchVO searchVo);
	int updateEducation(EducationVO vo);
	int deleteEducation(int eduNo);
	EducationVO selectByNoEducation(int eduNo);
	List<EducationVO> getTeaName(EducationVO vo);
	
	int insertTeacher(EducationVO vo);
	List<EducationVO> selectAllTeacher(SearchVO searchVo);
	int getTotalRecordTeacher(SearchVO searchVo);
	int deleteTeacher(int eduTeaNo);
	
	List<EducationVO> selectAllApplicant(SearchVO searchVo);
	int getTotalRecordApplicant(SearchVO searchVo);
	int deleteApplicant(int eduAppNo);
}
