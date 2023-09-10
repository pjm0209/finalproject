package com.team2.mbti.educationLike.model;

import java.util.List;
import java.util.Map;

import com.team2.mbti.education.model.EducationListVO;

public interface EducationLikeService {
	int insertEduLike(EducationLikeVO vo);
	int deleteEduLike(EducationLikeVO vo);
	List<Map<String, Object>> selectByNoEduLike(int no);
	int selectEduLikeByNo(EducationLikeVO vo);
}