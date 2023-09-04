package com.team2.mbti.main.book.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping("/bookBasket")
	public String bookBasket(@RequestParam(defaultValue = "0") int bookNo, Model model) {
		logger.info("책 주문 페이지 - bookBasket, 파라미터 bookNo={}", bookNo);

		return "main/book/bookBasket";
	}
	
	@RequestMapping("/bookOrderMain")
	public String bookOrderMain(@RequestParam(defaultValue = "0") int bookNo, Model model) {
		logger.info("책 주문 페이지 - bookOrderMain, 파라미터 bookNo={}", bookNo);

		return "main/book/bookOrderMain";
	}
	
	@RequestMapping("/bookOrdering")
	public String bookOrdering(@RequestParam(defaultValue = "0") int bookNo, Model model) {
		logger.info("책 주문 페이지 - bookOrderMain, 파라미터 bookNo={}", bookNo);

		return "main/book/bookOrdering";
	}
	
	@RequestMapping("/test/test")
	public String test(@RequestParam(defaultValue = "0") int bookNo, Model model) {
		logger.info("책 주문 페이지 - bookOrderMain, 파라미터 bookNo={}", bookNo);

		return "main/book/test/test";
	}
	
}//