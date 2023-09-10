package com.team2.mbti.educationLike.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.mbti.educationLike.model.EducationLikeService;
import com.team2.mbti.educationLike.model.EducationLikeVO;

import lombok.RequiredArgsConstructor;

@Controller
@ResponseBody
@RequiredArgsConstructor
@RequestMapping("/educationLike")
public class EducationLikeController {
	private static final Logger logger = LoggerFactory.getLogger(EducationLikeController.class);
	
	private final EducationLikeService educationLikeService;
	
	
	@RequestMapping("/eduLikeIns")
	public int eduLikeInsert(@ModelAttribute EducationLikeVO vo) {
		logger.info("교육 찜하기 처리, 파라미터 vo={}", vo);
		
		int cnt = educationLikeService.insertEduLike(vo);
		logger.info("교육 찜하기 처리 결과, cnt={}", cnt);
		
		return cnt;
	}
	
	@RequestMapping("/eduLikeDel")
	public int eduLikeDelete(@ModelAttribute EducationLikeVO vo) {
		logger.info("교육 찜하기 취소 처리, 파라미터 vo={}", vo);
		
		int cnt = educationLikeService.deleteEduLike(vo);
		logger.info("교육 찜하기 취소 처리 결과, cnt={}", cnt);
		
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping("/eduLikeSel")
	public int eduLikeSel(@ModelAttribute EducationLikeVO vo) {
		int cnt = educationLikeService.selectEduLikeByNo(vo);
		
		return cnt;
	}
}