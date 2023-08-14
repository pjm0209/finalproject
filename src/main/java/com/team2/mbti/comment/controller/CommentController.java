package com.team2.mbti.comment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.mbti.comment.model.CommentService;
import com.team2.mbti.comment.model.CommentVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/comments")
@RequiredArgsConstructor
public class CommentController {
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	private final CommentService commentService;
	
	@ResponseBody
	@RequestMapping("/wirte")
	public int commentWrite(@ModelAttribute CommentVO vo) {
		logger.info("댓글 쓰기 파라미터 vo: {}", vo);
		
		int cnt = commentService.insertComments(vo);
		logger.info("댓글 쓰기 처리결과 cnt: {}", cnt);
		
		return cnt;
	}
}