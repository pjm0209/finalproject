package com.team2.mbti.main.board.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.mbti.board.model.BoardFormVO;
import com.team2.mbti.board.model.BoardService;
import com.team2.mbti.board.model.BoardVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main/board")
public class MainBoardController {
	private static final Logger logger = LoggerFactory.getLogger(MainBoardController.class);
	
	private final BoardService boardService;
	
	@RequestMapping("/boardFormList")
	public String boardFormList(Model model) {
		logger.info("게시판 종류 조회");
		
		List<BoardFormVO> boardFormList = boardService.selectAllBoard();
		logger.info("게시판 종류 조회결과 boardFormList: {}", boardFormList);
		
		model.addAttribute("boardFormList", boardFormList);
		
		return "main/board/boardFormList";
	}
	
	@RequestMapping("/boardMain")
	public String boardMain(Model model) {
		logger.info("커뮤니티 메인페이지");
		
		List<Map<String, Object>> boardCategoryList = boardService.selectMainBoardFormCategory();
		logger.info("게시판목록 조회결과 boardCategoryList: {}", boardCategoryList);
		
		model.addAttribute("boardCategoryList", boardCategoryList);
		
		return "main/board/boardMain";
	}
	
	@RequestMapping("/boardList")
	public String boardList(@ModelAttribute BoardVO vo, Model model) {
		logger.info("게시판 리스트 파라미터 vo: {}", vo);
		
		List<Map<String, Object>> boardList = boardService.selectAll(vo);
		logger.info("게시판 리스트 조회결과 boardList: {}", boardList);
		
		model.addAttribute("boardList", boardList);
		
		return "main/board/boardList";
	}
}