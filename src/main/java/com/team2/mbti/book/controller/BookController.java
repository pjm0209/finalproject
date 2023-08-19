package com.team2.mbti.book.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.mbti.book.model.BookService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/book")
public class BookController {
	
	private static final Logger logger = LoggerFactory.getLogger(BookController.class); 
	private final BookService bookService;
	
	@RequestMapping("/bookList")
	public String bookList(Model model) {
		logger.info("책관리 페이지 - 책 리스트 페이지입니다.");
		
		model.addAttribute("title", "책관리 페이지");
		
		return "admin/book/bookList";
	}
	
	@RequestMapping("/bookInventory")
	public String bookInventory(Model model) {
		logger.info("책관리 페이지 - 책 재고 관리 페이지입니다.");
		
		model.addAttribute("title", "책 재고관리 페이지");
		
		return "admin/book/bookInventory";
	}
	
	@GetMapping("/bookRegister")
	public String bookRegister_get(Model model) {
		logger.info("책관리 페이지 - 책 상품 등록 페이지입니다.");
		
		model.addAttribute("title", "책 등록 페이지");
		
		return "admin/book/bookRegister";
	}
	
	@PostMapping("/bookRegister")
	public String bookRegister_post(Model model) {
		//1
		logger.info("책관리 페이지 - 책 상품 등록 처리하기");
		
		//2
		
		//3
		model.addAttribute("title", "책 등록 페이지");
		
		//4
		return "redirect:/admin/book/bookList";
	}
	
	@RequestMapping("/bookSummingUp")
	public String bookSummingUp(Model model) {
		logger.info("책관리 페이지 - 책 매출현황 페이지입니다.");
		
		model.addAttribute("title", "책 매출현황 페이지");
		
		return "admin/book/bookSummingUp";
	}
	
	@RequestMapping("/bookDelete")
	public String bookDelete(@RequestParam(defaultValue = "0")int bookNo , Model model) {
		logger.info("책관리 페이지 - 책 상품 삭제하기, 파라미터 bookNo={}", bookNo);
		
		
		return "redirect:/admin/book/bookList";
	}

}//
