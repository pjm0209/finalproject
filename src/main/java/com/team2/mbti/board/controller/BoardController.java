package com.team2.mbti.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@GetMapping("/board")
	public String board_get(Model model) {
		logger.info("게시판 관리 화면 보여주기");
		
		model.addAttribute("title", "게시판 관리");
		
		return "admin/board/board";
	}
	
	@GetMapping("/boardCreate")
	public String boardCreate_get(Model model) {
		logger.info("게시판 만들기 화면 보여주기");
		
		model.addAttribute("title", "게시판 만들기");
		
		return "admin/board/boardCreate";
	}		
}