package com.team2.mbti.main.book.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.mbti.book.model.BookService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main/book")
public class MainBookController {

	private static final Logger logger = LoggerFactory.getLogger(MainBookController.class);
	private final BookService bookService;

	@RequestMapping("/bookMain")
	public String bookList(Model model) {
		logger.info("책 메인 판매 페이지 - 책 리스트 페이지입니다.");

		model.addAttribute("title", "책 판매 페이지");

		return "main/book/bookMain";
	}
	@RequestMapping("/bookDetail")
	public String bookDetail(Model model) {
		logger.info("책 메인 판매 페이지 - 책 상세보기 페이지입니다.");

		model.addAttribute("title", "책 판매 페이지");

		return "main/book/bookDetail";
	}
	
	
	@RequestMapping("/bookList1")
	public String bookList1(Model model) {
		logger.info("bookList1");

		model.addAttribute("title", "bookList1");

		return "main/book/bookList1";
	}
}//