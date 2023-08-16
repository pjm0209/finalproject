package com.team2.mbti.boardlike.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.mbti.boardlike.model.BoardLikeService;
import com.team2.mbti.boardlike.model.BoardLikeVO;

import lombok.RequiredArgsConstructor;

@Controller
@ResponseBody
@RequestMapping("/boardLike")
@RequiredArgsConstructor
public class BoardLikeController {
	private static final Logger logger = LoggerFactory.getLogger(BoardLikeController.class);
	
	private final BoardLikeService boardLikeService;
	
	@RequestMapping("/count")
	public int boardLikeSelect(@RequestParam(defaultValue = "0") int boardNo) {
		logger.info("좋아요 개수검색 파라미터 boardNo: {}", boardNo);
		
		int result = boardLikeService.selectLikeByBoardNo(boardNo);
		logger.info("좋아요 개수 검색결과 result: {}", result);

		return result;
	}
	
	@RequestMapping("/like")
	public int boardLike(@ModelAttribute BoardLikeVO vo) {
		logger.info("좋아요유무 검색 파라미터 vo: {}", vo);
		
		int cnt = boardLikeService.selectLikeBoard(vo);
		logger.info("좋아요 유무 검색결과 cnt: {}", cnt);
		
		return cnt;
	}
	
	@RequestMapping("/likeIns")
	public int boardLikeIns(@ModelAttribute BoardLikeVO vo) {
		logger.info("좋아요 처리 파라미터 vo: {}", vo);
		
		int cnt = boardLikeService.insertLike(vo);
		logger.info("좋아요 처리결과 cnt: {}", cnt);
		
		return cnt;
	}
	
	@RequestMapping("/likeDel")
	public int boardLikeDel(@ModelAttribute BoardLikeVO vo) {
		logger.info("좋아요 해제 파라미터 vo: {}", vo);
		
		int cnt = boardLikeService.deleteBoardLike(vo);
		logger.info("좋아요 해제처리결과 cnt: {}", cnt);
		
		return cnt;
	}
}