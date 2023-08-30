package com.team2.mbti.book.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.mbti.book.model.BookService;
import com.team2.mbti.book.model.StockBookVO;
import com.team2.mbti.book.model.orderBookVO;
import com.team2.mbti.common.ConstUtil;
import com.team2.mbti.common.PaginationInfo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/book")
public class BookController {

	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	private final BookService bookService;
/*
	@RequestMapping("/bookList")
	public String bookList(@ModelAttribute StockBookVO vo, HttpServletRequest request , Model model) {
		// 1
		logger.info("책관리 페이지 - 책 리스트 페이지입니다.,파라미터 vo={}", vo);
		// 2
		
		//
		//
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		
		String bookFlag = request.getParameter("bookFlag");
		if( (bookFlag != null && !bookFlag.isEmpty()) &&
			( bookFlag.equals("bookList") || bookFlag.equals("bookListByKeyword")
			|| bookFlag.equals("Inventory") || bookFlag.equals("InventoryByKeyword")) ) {
			
			vo.setBookFlag(bookFlag);
		} else {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/index");
			
			return "common/message";
		}
		
		if (bookFlag.equals("bookList")) {
			pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
			vo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		} else if (bookFlag.equals("bookListByKeyword")) {
			pagingInfo.setRecordCountPerPage(vo.getPerRecord());
			vo.setRecordCountPerPage(vo.getPerRecord());
			logger.info(" 레코드 확인용 vo={}", vo);
		} else if(bookFlag.equals("Inventory")) {
			pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
			vo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		} else if(bookFlag.equals("InventoryByKeyword")) {
			pagingInfo.setRecordCountPerPage(vo.getPerRecord());
			vo.setRecordCountPerPage(vo.getPerRecord());
		}
		
		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("변경 후 vo={}", vo);
		
		List<Map<String, Object>> list = bookService.selectBookAll(vo);
		logger.info("관리자 페이지 - 책 리스트 검색결과 list.size()={}", list.size());

		int totalRecord = bookService.selectBookCnt(vo);
		logger.info("책 전체 개수 조회 결과 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		// 3
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list", list);
		model.addAttribute("title", "책관리 페이지");
		
		logger.info("bookFlag={}", bookFlag);
		// 4
		return "admin/book/bookList";
	}
*/	
	@RequestMapping("/bookList")
	/*HttpServletRequest request, HttpSession session, Model model*/
	public String bookList(HttpServletRequest request, Model model) {
		String bookFlag = request.getParameter("bookFlag");
		logger.info("책관리 페이지 - 책 리스트 페이지입니다.,파라미터 bookFlag={}", bookFlag);

		String url = "admin/book/bookList?bookFlag=" + bookFlag;

		if ((bookFlag != null && !bookFlag.isEmpty())
				&& (bookFlag.equals("bookList") || bookFlag.equals("bookListByKeyword")
						|| bookFlag.equals("Inventory")
						|| bookFlag.equals("InventoryByKeyword"))) {

			logger.info("url={}", url);
			logger.info("<c:if test=\"${param.bookFlag != 'Inventory' or param.bookFlag == 'bookListByKeyword'}\">");
		} else {
			
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/index");

			return "common/message";
		}

		return "admin/book/bookList";
	}
	
	@ResponseBody
	@RequestMapping("/bookAjaxList")
	public List<StockBookVO> bookAjaxList(@ModelAttribute StockBookVO vo, HttpServletRequest request , Model model) {
		// 1
		logger.info("책관리 페이지 - 책 리스트 페이지입니다.,파라미터 vo={}", vo);
		logger.info("ajax 이용 - ajaxList");
		// 2
		//
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		
		String bookFlag = request.getParameter("bookFlag");
		/*
		if( (bookFlag != null && !bookFlag.isEmpty()) &&
			( bookFlag.equals("bookList") || bookFlag.equals("bookListByKeyword")
			|| bookFlag.equals("Inventory") || bookFlag.equals("InventoryByKeyword")) ) {
			
			vo.setBookFlag(bookFlag);
		} else {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/index");
			
			return "common/message";
		}*/
		if (bookFlag.equals("bookList")) {
			pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
			vo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		} else if (bookFlag.equals("bookListByKeyword")) {
			pagingInfo.setRecordCountPerPage(vo.getPerRecord());
			vo.setRecordCountPerPage(vo.getPerRecord());
			logger.info(" 레코드 확인용 vo={}", vo);
		} else if(bookFlag.equals("Inventory")) {
			pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
			vo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		} else if(bookFlag.equals("InventoryByKeyword")) {
			pagingInfo.setRecordCountPerPage(vo.getPerRecord());
			vo.setRecordCountPerPage(vo.getPerRecord());
		}
		
		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("변경 후 vo={}", vo);
		
		List<StockBookVO> list = bookService.selectBookAllAjax(vo);
		logger.info("관리자 페이지 - 책 리스트 ajax 검색결과 list.size()={}", list.size());

		int totalRecord = bookService.selectBookCnt(vo);
		logger.info("책 전체 개수 조회 결과 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		// 3
		model.addAttribute("pagingInfo", pagingInfo);
		/* model.addAttribute("list", list); */
		model.addAttribute("title", "책관리 페이지");
		logger.info("bookFlag={}", bookFlag);
		
		// 4
		/* return "admin/book/bookList"; */
		return list;
		
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

	@RequestMapping("/bookEdit")
	public String bookEdit(@RequestParam(defaultValue = "0") int bookNo, Model model) {
		logger.info("책관리 페이지 - 책 상품 수정하기, 파라미터 bookNo={}", bookNo);

		return "redirect:/admin/book/bookList";
	}
	
}//
