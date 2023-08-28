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
	public List<EducationVO> selectAllLocation(EducationVO vo) {
		return educationDao.selectAllLocation(vo);
	}

	@Override
	public int getTotalRecordLocation(EducationVO vo) {
		return educationDao.getTotalRecordLocation(vo);
	}

	@Override
	public int insertEducation(EducationVO vo) {
		return educationDao.insertEducation(vo);
	}

	@Override
	public List<EducationVO> selectAllEducation(EducationVO vo) {
		return educationDao.selectAllEducation(vo);
	}

	@Override
	public int getTotalRecordEducation(EducationVO vo) {
		return educationDao.getTotalRecordEducation(vo);
	}

	@Override
	public int insertTeacher(EducationVO vo) {
		return educationDao.insertTeacher(vo);
	}

	@Override
	public List<EducationVO> selectAllTeacher(EducationVO vo) {
		return educationDao.selectAllTeacher(vo);
	}

	@Override
	public int getTotalRecordTeacher(EducationVO vo) {
		return educationDao.getTotalRecordTeacher(vo);
	}

	@Override
	public int deleteLocation(List<EducationVO> list) {
		int cnt = 0;
		
		for(EducationVO vo : list) {
			cnt = educationDao.deleteLocation(vo.getEpNo());
		}
		
		return cnt;
	}

	@Override
	public int deleteTeacher(List<EducationVO> list) {
		int cnt = 0;
		
		for(EducationVO vo : list) {
			cnt = educationDao.deleteTeacher(vo.getEduTeaNo());
		}
		
		return cnt;
	}

	@Override
	public int deleteEducation(List<EducationVO> list) {
		int cnt = 0;
		
		for(EducationVO vo : list) {
			cnt = educationDao.deleteEducation(vo.getEduNo());
		}
		
		return cnt;
	}

	@Override
	public List<EducationVO> selectAllApplicant(EducationVO vo) {
		return educationDao.selectAllApplicant(vo);
	}

	@Override
	public int getTotalRecordApplicant(EducationVO vo) {
		return educationDao.getTotalRecordApplicant(vo);
	}

	@Override
	public int deleteApplicant(List<EducationVO> list) {
		int cnt = 0;
		
		for(EducationVO vo : list) {
			cnt = educationDao.deleteApplicant(vo.getEduAppNo());
		}
		
		return cnt;
	}

	@Override
	public EducationVO selectByNoEducation(int eduNo) {
		return educationDao.selectByNoEducation(eduNo);
	}

	@Override
	public int updateEducation(EducationVO vo) {
		return educationDao.updateEducation(vo);
	}

	@Override
	public List<EducationVO> getTeaName() {
		return educationDao.getTeaName();
	}

	@Override
	public List<EducationVO> getEpName() {
		return educationDao.getEpName();
	}

	@Override
	public int updateApplicant(List<EducationVO> list) {
		int cnt = 0;
		
		for(EducationVO vo : list) {
			cnt = educationDao.updateApplicant(vo.getEduAppNo());
		}
		
		return cnt;
	}

	@Override
	public int updateLocation(EducationVO vo) {
		return educationDao.updateLocation(vo);
	}

	@Override
	public EducationVO selectByNoLocation(int epNo) {
		return educationDao.selectByNoLocation(epNo);
	}

	@Override
	public int updateTeacher(EducationVO vo) {
		return educationDao.updateTeacher(vo);
	}

	@Override
	public EducationVO selectByNoTeacher(int eduTeaNo) {
		return educationDao.selectByNoTeacher(eduTeaNo);
	}

}
