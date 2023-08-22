package com.team2.mbti.book.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.mbti.book.model.BookService;
import com.team2.mbti.book.model.BookVO;
import com.team2.mbti.common.ConstUtil;
import com.team2.mbti.common.PaginationInfo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/book")
public class BookController {

	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	private final BookService bookService;

	@RequestMapping("/bookList")
	public String bookList(@ModelAttribute BookVO bookVo, Model model) {
		// 1
		logger.info("책관리 페이지 - 책 리스트 페이지입니다.");
		
		// 2
		//
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(bookVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);

		bookVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		bookVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<BookVO> list = bookService.selectBookAll(bookVo);
		logger.info("관리자 페이지 - 책 리스트 검색결과 list.size()", list.size());

		int totalRecord = bookService.selectBookCnt();
		logger.info("책 전체 개수 조회 결과 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		// 3
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list", list);
		model.addAttribute("title", "책관리 페이지");

		// 4
		return "admin/book/bookList";
	}
	
	@RequestMapping("/bookSearch")
	public String bookSearch(@ModelAttribute BookVO bookVo, @RequestParam(required = false)int cntPerRecord,
			Model model) {
		// 1
		logger.info("책관리 페이지 - 책 리스트 페이지입니다.");
		
		// 2
		//
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(bookVo.getCurrentPage());
		if(cntPerRecord == 0) {
			pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		} else {
			pagingInfo.setRecordCountPerPage(cntPerRecord);
		}

		bookVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		bookVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<BookVO> list = bookService.selectBookAll(bookVo);
		logger.info("관리자 페이지 - 책 리스트 검색결과 list.size()", list.size());

		int totalRecord = bookService.selectBookCnt();
		logger.info("책 전체 개수 조회 결과 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		// 3
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list", list);
		model.addAttribute("title", "책관리 페이지");

		// 4
		return "redirect:/admin/book/bookList";
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
		// 1
		logger.info("책관리 페이지 - 책 상품 등록 처리하기");

		// 2

		// 3
		model.addAttribute("title", "책 등록 페이지");

		// 4
		return "redirect:/admin/book/bookList";
	}

	@RequestMapping("/bookSummingUp")
	public String bookSummingUp(Model model) {
		logger.info("책관리 페이지 - 책 매출현황 페이지입니다.");

		model.addAttribute("title", "책 매출현황 페이지");

		return "admin/book/bookSummingUp";
	}

	@RequestMapping("/bookDelete")
	public String bookDelete(@RequestParam(defaultValue = "0") int bookNo, Model model) {
		logger.info("책관리 페이지 - 책 상품 삭제하기, 파라미터 bookNo={}", bookNo);

		return "redirect:/admin/book/bookList";
	}

}//
