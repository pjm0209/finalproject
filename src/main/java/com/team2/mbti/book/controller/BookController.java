package com.team2.mbti.book.controller;

import java.io.IOException;
import java.util.HashMap;
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
import com.team2.mbti.common.ConstUtil;
import com.team2.mbti.common.PaginationInfo;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/book")
public class BookController {

	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	private final BookService bookService;
	private final FileUploadUtil2 fileUploadUtil2;
	/*
	 * @RequestMapping("/bookList") public String bookList(@ModelAttribute
	 * StockBookVO vo, HttpServletRequest request , Model model) { // 1
	 * logger.info("책관리 페이지 - 책 리스트 페이지입니다.,파라미터 vo={}", vo); // 2
	 * 
	 * // // PaginationInfo pagingInfo = new PaginationInfo();
	 * pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
	 * pagingInfo.setCurrentPage(vo.getCurrentPage());
	 * 
	 * String bookFlag = request.getParameter("bookFlag"); if( (bookFlag != null &&
	 * !bookFlag.isEmpty()) && ( bookFlag.equals("bookList") ||
	 * bookFlag.equals("bookListByKeyword") || bookFlag.equals("Inventory") ||
	 * bookFlag.equals("InventoryByKeyword")) ) {
	 * 
	 * vo.setBookFlag(bookFlag); } else { model.addAttribute("msg", "잘못된 url입니다.");
	 * model.addAttribute("url", "/admin/index");
	 * 
	 * return "common/message"; }
	 * 
	 * if (bookFlag.equals("bookList")) {
	 * pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
	 * vo.setRecordCountPerPage(ConstUtil.RECORD_COUNT); } else if
	 * (bookFlag.equals("bookListByKeyword")) {
	 * pagingInfo.setRecordCountPerPage(vo.getPerRecord());
	 * vo.setRecordCountPerPage(vo.getPerRecord()); logger.info(" 레코드 확인용 vo={}",
	 * vo); } else if(bookFlag.equals("Inventory")) {
	 * pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
	 * vo.setRecordCountPerPage(ConstUtil.RECORD_COUNT); } else
	 * if(bookFlag.equals("InventoryByKeyword")) {
	 * pagingInfo.setRecordCountPerPage(vo.getPerRecord());
	 * vo.setRecordCountPerPage(vo.getPerRecord()); }
	 * 
	 * vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
	 * logger.info("변경 후 vo={}", vo);
	 * 
	 * List<Map<String, Object>> list = bookService.selectBookAll(vo);
	 * logger.info("관리자 페이지 - 책 리스트 검색결과 list.size()={}", list.size());
	 * 
	 * int totalRecord = bookService.selectBookCnt(vo);
	 * logger.info("책 전체 개수 조회 결과 totalRecord={}", totalRecord);
	 * pagingInfo.setTotalRecord(totalRecord);
	 * 
	 * // 3 model.addAttribute("pagingInfo", pagingInfo); model.addAttribute("list",
	 * list); model.addAttribute("title", "책관리 페이지");
	 * 
	 * logger.info("bookFlag={}", bookFlag); // 4 return "admin/book/bookList"; }
	 */
	@RequestMapping("/bookList")
	/* HttpServletRequest request, HttpSession session, Model model */
	public String bookList(HttpServletRequest request, Model model) {
		String bookFlag = request.getParameter("bookFlag");
		logger.info("책관리 페이지 - 책 리스트 페이지입니다.,파라미터 bookFlag={}", bookFlag);

		String url = "admin/book/bookList?bookFlag=" + bookFlag;

		if ((bookFlag != null && !bookFlag.isEmpty())
				&& (bookFlag.equals("bookList") || bookFlag.equals("bookListByKeyword") || bookFlag.equals("Inventory")
						|| bookFlag.equals("InventoryByKeyword"))) {

			logger.info("url={}", url);
		} else {

			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/index");

			return "common/message";
		}

		return "admin/book/bookList";
	}

	@ResponseBody
	@RequestMapping("/bookAjaxList")
	public Map<String, Object> bookAjaxList(@ModelAttribute StockBookVO vo, HttpServletRequest request, Model model) {
		// 1
		logger.info("책관리 페이지 - 책 리스트 페이지입니다.,파라미터 vo={}", vo);
		logger.info("ajax 이용 - ajaxList");

		Map<String, Object> map= new HashMap<>();
		// 2
		//
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		
		logger.info("vo.getCurrentPage()={}", vo.getCurrentPage());
		logger.info("pagingInfo.getCurrentPage()={}", pagingInfo.getCurrentPage());
		
		String bookFlag = request.getParameter("bookFlag");
		/*
		 * if( (bookFlag != null && !bookFlag.isEmpty()) && (
		 * bookFlag.equals("bookList") || bookFlag.equals("bookListByKeyword") ||
		 * bookFlag.equals("Inventory") || bookFlag.equals("InventoryByKeyword")) ) {
		 * 
		 * vo.setBookFlag(bookFlag); } else { model.addAttribute("msg", "잘못된 url입니다.");
		 * model.addAttribute("url", "/admin/index");
		 * 
		 * return "common/message"; }
		 */
		if (bookFlag.equals("bookList")) {
			pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
			vo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		} else if (bookFlag.equals("bookListByKeyword")) {
			pagingInfo.setRecordCountPerPage(vo.getPerRecord());
			vo.setRecordCountPerPage(vo.getPerRecord());
			logger.info(" 레코드 확인용 vo={}", vo);
		} else if (bookFlag.equals("Inventory")) {
			pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
			vo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		} else if (bookFlag.equals("InventoryByKeyword")) {
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
		logger.info("pagingInfo 객체, pagingInfo={}", pagingInfo);

		
		// 3
		/*
		 * model.addAttribute("pagingInfo", pagingInfo); model.addAttribute("list",
		 * list); model.addAttribute("title", "책관리 페이지"); logger.info("bookFlag={}",
		 * bookFlag);
		 */
		map.put("list",list);
		map.put("bookFlag",bookFlag);
		map.put("pagingInfo",pagingInfo);
		
		
		
		// 4
		/* return "admin/book/bookList"; */
		return map;

	}

	@GetMapping("/bookRegister")
	public String bookRegister_get(Model model) {
		logger.info("책관리 페이지 - 책 상품 등록 페이지입니다.");

		model.addAttribute("title", "책 등록 페이지");

		return "admin/book/bookRegister";
	}

	
	@PostMapping("/bookRegister")
	public String bookRegister_post(@ModelAttribute StockBookVO vo, HttpServletRequest request, Model model) {
		logger.info("책관리 페이지 - 책 상품 등록 처리하기, 파라미터 vo={}", vo);
		
		List<Map<String, Object>> fileList = null;
		try {
			fileList = fileUploadUtil2.fileupload(request, ConstUtil.UPLOAD_IMAGE_FLAG);

			String bookImgName = "", bookImgOriginalname = "";
			long bookImgSize = 0;
			for (Map<String, Object> map : fileList) {
				bookImgName = (String) map.get("fileName");
				bookImgOriginalname = (String) map.get("originalFileName");
				bookImgSize = (long) map.get("fileSize");
				
				vo.setBookImgName(bookImgName);
				vo.setBookImgOriginalname(bookImgOriginalname);
				vo.setBookImgSize(bookImgSize);
			} // for
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int cnt = bookService.insertBook(vo);
		logger.info("상품 등록 처리결과 cnt={}", cnt);
		logger.info("파일업로드 처리결과 list.size()={}", fileList.size());
		if(cnt > 0) {
			model.addAttribute("url", "admin/book/bookList");
			model.addAttribute("msg", "상품등록이 완료되었습니다.");
		} else {
			model.addAttribute("url", "admin/book/bookRegister");
			model.addAttribute("msg", "상품등록 실패...");
		}
		
		
		return "common/message";
	}
	
	@GetMapping("/bookEdit")
	public String bookEdit_get(HttpServletRequest request ,Model model) {
		logger.info("책관리 페이지 - 책 상품 수정 페이지입니다.");

		model.addAttribute("title", "책 등록 페이지");

		return "admin/book/bookEdit";
	}

	@PostMapping("/bookEdit")
	public String bookEdit_post(Model model) {
		// 1
		logger.info("책관리 페이지 - 책 상품 수정 처리하기");

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

		return "redirect:/admin/book/bookRegister";
	}
	
	

}//
