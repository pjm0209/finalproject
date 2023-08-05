package com.team2.mbti.book.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.mbti.book.model.BookService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BookController {
	
	private static final Logger logger = LoggerFactory.getLogger(BookController.class); 
	private final BookService bookService;
	
	@RequestMapping("/admin/book/bookList")
	public String bookList(Model model) {
		logger.info("책관리 페이지 - 책 리스트 페이지입니다.");
		
		model.addAttribute("title", "책관리 페이지");
		
		return "admin/book/bookList";
	}
	
	@RequestMapping("/admin/book/bookInventory")
	public String bookInventory(Model model) {
		logger.info("책관리 페이지 - 책 재고 관리 페이지입니다.");
		
		model.addAttribute("title", "책 재고관리 페이지");
		
		return "admin/book/bookInventory";
	}
	
	@RequestMapping("/admin/book/bookBasket")
	public String bookBasket(Model model) {
		logger.info("책관리 페이지 - 책 장바구니 관리 페이지입니다.");
		
		model.addAttribute("title", "책 장바구니 페이지");
		
		return "admin/book/bookBasket";
	}
}//
