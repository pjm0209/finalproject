package com.team2.mbti.main.book.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.mbti.common.ConstUtil;
import com.team2.mbti.common.PaginationInfo;
import com.team2.mbti.main.book.model.MainBookService;
import com.team2.mbti.main.book.model.MainBookVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main/book")
public class MainBookController {

	private static final Logger logger = LoggerFactory.getLogger(MainBookController.class);
	private final MainBookService mainBookService;

	@RequestMapping("/bookMain")
	public String bookMain(@ModelAttribute MainBookVO vo, Model model) {
		
		logger.info("책 메인 판매 페이지, 파라미터 vo={}", vo);
		String title = "";
		
;		String sk = vo.getSearchKeyword();
		if(sk != null && !sk.isEmpty() ) {
			logger.info("키워드 : \"{}\" 로 검색한 결과 리스트 처리하기", sk);
	
			PaginationInfo pagingInfo = new PaginationInfo();
			pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
			pagingInfo.setCurrentPage(vo.getCurrentPage());
	
			logger.info("vo.getCurrentPage()={}", vo.getCurrentPage());
			logger.info("pagingInfo.getCurrentPage()={}", pagingInfo.getCurrentPage());
	
			pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
			vo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
	
			vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
			logger.info("변경 후 vo={}", vo);
	
			List<MainBookVO> list = mainBookService.selectBookAll(vo);
			model.addAttribute("list", list);
			logger.info("category ={}, searchKeyword={}, list.size()={}", vo.getBookCategory(), vo.getSearchKeyword(),
					list.size());
	
			int totalRecord = mainBookService.selectBookAllCnt(vo);
			logger.info("책 전체 개수 조회 결과 totalRecord={}", totalRecord);
			pagingInfo.setTotalRecord(totalRecord);
			logger.info("pagingInfo 객체, pagingInfo={}", pagingInfo);
			
			model.addAttribute("searchKeyword", vo.getSearchKeyword());
			model.addAttribute("pagingInfo", pagingInfo);
			model.addAttribute("list", list);
			title = "책 판매 페이지 - 검색 결과";
		}
		title = "책 판매 페이지";
		// 3
		model.addAttribute("title", title);

		return "main/book/bookMain";
	}

	@RequestMapping("/bookDetail")
	public String bookDetail(@RequestParam(defaultValue = "0") int bookNo, Model model) {
		logger.info("책 메인 판매 페이지 - 책 상세보기 페이지입니다,파라미터 bookNo={}", bookNo);
		if (bookNo == 0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/main/book/bookMain");
			return "common/message";
		}

		MainBookVO vo = mainBookService.selectBookByNo(bookNo);
		if (vo == null) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/main/book/bookMain");
			return "common/message";
		}
		model.addAttribute("title", "책 판매 페이지");
		model.addAttribute("vo", vo);

		return "main/book/bookDetail";
	}

	@RequestMapping("/bookList1")
	public String bookList1(@ModelAttribute MainBookVO vo, Model model) {
		logger.info("책 메인 판매 페이지 - 카테고리별 상품 분류 페이지입니다, 파라미터 vo={}", vo);

		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(vo.getCurrentPage());

		logger.info("vo.getCurrentPage()={}", vo.getCurrentPage());
		logger.info("pagingInfo.getCurrentPage()={}", pagingInfo.getCurrentPage());

		if (vo.getBookCategory() == null || vo.getBookCategory().isEmpty()) {

			model.addAttribute("msg", "category miss, 잘못된 url입니다.");
			model.addAttribute("url", "/main/book/bookMain");

			return "common/message";
		}

		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		vo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);

		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("변경 후 vo={}", vo);

		List<MainBookVO> list = mainBookService.selectByCategory(vo);
		model.addAttribute("list", list);
		logger.info("category ={}, searchKeyword={}, list.size()={}", vo.getBookCategory(), vo.getSearchKeyword(),
				list.size());

		int totalRecord = mainBookService.selectByCategoryCnt(vo);
		logger.info("책 전체 개수 조회 결과 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("pagingInfo 객체, pagingInfo={}", pagingInfo);

		// 3
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list", list);
		model.addAttribute("title", "책관리 페이지");

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