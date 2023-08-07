package com.team2.mbti.order.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.mbti.book.controller.BookController;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(BookController.class); 
	
	@RequestMapping("/admin/order/bookBasket")
	public String bookList(Model model) {
		logger.info("주문관리 페이지 - 장바구니 리스트 페이지입니다.");
		
		model.addAttribute("title", "장바구니 페이지");
		
		return "admin/order/bookBasket";
	}
	
	@RequestMapping("/admin/order/orderList")
	public String orderList(Model model) {
		logger.info("주문관리 페이지 - 주문 리스트 페이지입니다.");
		
		model.addAttribute("title", "주문 리스트 페이지");
		
		return "admin/order/orderList";
	}
	
	@RequestMapping("/admin/order/orderDetail")
	public String orderDetail(Model model) {
		logger.info("주문관리 페이지 - 주문 상세보기 페이지입니다.");
		
		model.addAttribute("title", "주문 상세보기 페이지");
		
		return "admin/order/orderDetail";
	}
	
}
