package com.team2.mbti.comment.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	@RequestMapping("/write")
	public int commentWrite(@ModelAttribute CommentVO vo) {
		logger.info("댓글 쓰기 파라미터 vo: {}", vo);
		
		int cnt = commentService.insertComments(vo);
		logger.info("댓글 쓰기 처리결과 cnt: {}", cnt);
		
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping("/list")
	public List<Map<String, Object>> commentList(@RequestParam int boardNo) {
		logger.info("댓글 리스트 조회 파라미터 boardNo: {}", boardNo);
		
		List<Map<String, Object>> list = commentService.selectCommentList(boardNo);
		logger.info("댓글 리스트 검색결과 list: {}", list);
		
		return list;
	}
}