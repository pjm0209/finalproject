package com.team2.mbti.education.model;

import java.util.List;

import com.team2.mbti.common.SearchVO;

public interface EducationService {
	int insertLocation(EducationVO vo);
	List<EducationVO> selectAllLocation(EducationVO vo);
	int getTotalRecordLocation(EducationVO vo);
	int updateLocation(EducationVO vo);
	int deleteLocation(List<EducationVO> list);
	EducationVO selectByNoLocation(int epNo);
	
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
	int updateTeacher(EducationVO vo);
	int deleteTeacher(List<EducationVO> list);
	EducationVO selectByNoTeacher(int eduTeaNo);
	
	int insertApply(EducationVO vo);
	List<EducationVO> selectAllApplicant(EducationVO vo);
	int getTotalRecordApplicant(EducationVO vo);
	int deleteApplicant(List<EducationVO> list);
	int updateApplicant(List<EducationVO> list);
	
	List<EducationVO> selectAllList(EducationVO vo);
	
	List<EducationVO> selectAllLocName();
	
	List<EducationVO> selectMyAllEdu(EducationVO vo);
	List<EducationVO> myPayEdu(EducationVO vo);
	int getTotalRecordEduList(EducationVO vo);
	int cancelApplicant(int [] eduAppNo);
	
	List<EducationVO> applyMemInfo(EducationVO vo);
	List<Integer> selectMemNo(int eduNo);
	EducationVO selectAllMemInfo(EducationVO vo);
	List<EducationVO> myFinishEdu(EducationVO vo);
	int applyPayFinish(int eduAppNo);
	
	int insertSalesByEdu(EducationVO vo);
	
	int selectEducationFlag(EducationVO vo);
}