package com.team2.mbti.education.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.team2.mbti.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EducationServiceImpl implements EducationService{
	private final EducationDAO educationDao;
	
	@Override
	public int insertLocation(EducationVO vo) {
		return educationDao.insertLocation(vo);
	}
	
	@Override
	public List<EducationVO> selectAllLocation(SearchVO vo) {
		return educationDao.selectAllLocation(vo);
	}

	@Override
	public int getTotalRecordLocation(SearchVO searchVo) {
		return educationDao.getTotalRecordLocation(searchVo);
	}

	@Override
	public int insertEducation(EducationVO vo) {
		return educationDao.insertEducation(vo);
	}

	@Override
	public List<EducationVO> selectAllEducation(SearchVO searchVo) {
		return educationDao.selectAllEducation(searchVo);
	}

	@Override
	public int getTotalRecordEducation(SearchVO searchVo) {
		return educationDao.getTotalRecordEducation(searchVo);
	}

	@Override
	public int insertTeacher(EducationVO vo) {
		return educationDao.insertTeacher(vo);
	}

	@Override
	public List<EducationVO> selectAllTeacher(SearchVO searchVo) {
		return educationDao.selectAllTeacher(searchVo);
	}

	@Override
	public int getTotalRecordTeacher(SearchVO searchVo) {
		return educationDao.getTotalRecordTeacher(searchVo);
	}

	@Override
	public int deleteLocation(int epNo) {
		return educationDao.deleteLocation(epNo);
	}

	@Override
	public int deleteTeacher(int eduTeaNo) {
		return educationDao.deleteTeacher(eduTeaNo);
	}

	@Override
	public int deleteEducation(int eduNo) {
		return educationDao.deleteEducation(eduNo);
	}

	@Override
	public List<EducationVO> selectAllApplicant(SearchVO searchVo) {
		return educationDao.selectAllApplicant(searchVo);
	}

	@Override
	public int getTotalRecordApplicant(SearchVO searchVo) {
		return educationDao.getTotalRecordApplicant(searchVo);
	}

	@Override
	public int deleteApplicant(int eduAppNo) {
		return educationDao.deleteApplicant(eduAppNo);
	}

}
