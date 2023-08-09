package com.team2.mbti.education.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.mbti.common.SearchVO;

@Mapper
public interface EducationDAO {
	int insertLocation(EducationVO vo);
	List<EducationVO> selectAllLocation(SearchVO searchVo);
	int getTotalRecordLocation(SearchVO searchVo);
	
	int insertEducation(EducationVO vo);
	List<EducationVO> selectAllEducation(SearchVO searchVo);
	int getTotalRecordEducation(SearchVO searchVo);
}
