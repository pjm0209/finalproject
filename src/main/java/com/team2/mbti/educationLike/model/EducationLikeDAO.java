package com.team2.mbti.educationLike.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EducationLikeDAO {
	int insertEduLike(EducationLikeVO vo);
	int deleteEduLike(EducationLikeVO vo);
}
