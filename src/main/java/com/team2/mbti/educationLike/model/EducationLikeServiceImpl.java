package com.team2.mbti.educationLike.model;

import org.springframework.stereotype.Service;

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
	
}
