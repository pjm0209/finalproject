package com.team2.mbti.educationLike.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.team2.mbti.education.model.EducationListVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EducationLikeServiceImpl implements EducationLikeService{
	private final EducationLikeDAO educationLikeDao;
	
	@Override
	public int insertEduLike(EducationLikeVO vo) {
		return educationLikeDao.insertEduLike(vo);
	}

	@Override
	public int deleteEduLike(EducationLikeVO vo) {
		return educationLikeDao.deleteEduLike(vo);
	}

	@Override
	public List<Map<String, Object>> selectByNoEduLike(int no) {
		return educationLikeDao.selectByNoEduLike(no);
	}

	@Override
	public int selectEduLikeByNo(EducationLikeVO vo) {
		return educationLikeDao.selectEduLikeByNo(vo);
	}
}