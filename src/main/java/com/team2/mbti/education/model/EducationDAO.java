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
<<<<<<< HEAD
	int deleteEducation(List<EducationVO> list);
=======
	int deleteEducation(int eduNo);
>>>>>>> branch 'dami' of https://github.com/pjm0209/finalproject.git
	
	int insertTeacher(EducationVO vo);
	List<EducationVO> selectAllTeacher(SearchVO searchVo);
	int getTotalRecordTeacher(SearchVO searchVo);
	int deleteTeacher(int eduTeaNo);
}
