package com.team2.mbti.book.controller;


import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
import com.team2.mbti.book.model.StockBookVOList;
import com.team2.mbti.common.ConstUtil;
import com.team2.mbti.common.PaginationInfo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
		if(bookFlag.equals("bookList") || bookFlag.equals("bookListByKeyword")) {
			model.addAttribute("title", "판매 상품 관리");
		}
		if(bookFlag.equals("Inventory") || bookFlag.equals("InventoryByKeyword")) {
			model.addAttribute("title", "상품 재고 관리");
		}
		
		return "admin/book/bookList";
	}

	@ResponseBody
	@RequestMapping("/bookAjaxList")
	public Map<String, Object> bookAjaxList(@ModelAttribute StockBookVO vo, HttpServletRequest request, Model model) {
		// 1
		logger.info("책관리 페이지 - 책 리스트 페이지입니다.,파라미터 vo={}", vo);
		logger.info("ajax 이용 - ajaxList");

		Map<String, Object> map = new HashMap<>();
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
		map.put("list", list);
		map.put("bookFlag", bookFlag);
		map.put("pagingInfo", pagingInfo);
		
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
				logger.info("bookImgName={}", bookImgName);
				bookImgOriginalname = (String) map.get("originalFileName");
				logger.info("bookImgOriginalname={}", bookImgOriginalname);
				bookImgSize = (long) map.get("fileSize");
				logger.info("bookImgSize={}", bookImgSize);

				vo.setBookImgName(bookImgName);
				vo.setBookImgOriginalname(bookImgOriginalname);
				vo.setBookImgSize(bookImgSize);
			} // for
			logger.info("변경 후1 vo={}", vo);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		logger.info("변경 후2 vo={}", vo);

		int cnt = bookService.insertBook(vo);

		logger.info("상품 등록 처리결과 cnt={}", cnt);
		logger.info("파일업로드 처리결과 list.size()={}", fileList.size());
		if (cnt > 0) {
			model.addAttribute("url", "/admin/book/bookList?bookFlag=bookList");
			model.addAttribute("msg", "상품등록이 완료되었습니다.");
		} else {
			model.addAttribute("url", "/admin/book/bookRegister");
			model.addAttribute("msg", "상품등록 실패...");
		}

		return "common/message";
	}

	@GetMapping("/bookEdit")
	public String bookEdit_get(@RequestParam(defaultValue = "0") int bookNo, HttpServletRequest request, Model model) {
		logger.info("책관리 페이지 - 책 상품 수정 페이지입니다, 파라미터 bookNo={}", bookNo);
		if (bookNo == 0) {
			model.addAttribute("url", "/admin/index");
			model.addAttribute("msg", "잘못된 url입니다.");
			return "common/message";
		}
		StockBookVO sbVo = bookService.selectBookByNo(bookNo);
		logger.info("책관리 페이지 - 책 상품 수정 - 번호로 조회결과, sbVo={}", sbVo);

		String sdfRegdate = sbVo.getBookRegdate().substring(0, 10);
		sbVo.setBookRegdate(sdfRegdate);

		model.addAttribute("title", "책 수정 페이지");
		model.addAttribute("vo", sbVo);

		return "admin/book/bookRegister";
	}

	@PostMapping("/bookEdit")
	public String bookEdit_post(@ModelAttribute StockBookVO sbVo, HttpServletRequest request, Model model) {
		// 1
		logger.info("책관리 페이지 - 책 상품 수정 처리하기 파라미터 sbVo={}", sbVo);

		// 2
		String oldFileName = sbVo.getBookImgName();
		logger.info("책 상품 수정 처리하기 - 기존 파일 이름 oldFileName={}", oldFileName);
		String updatedFileName = "", updatedOriginalFileName = "";
		long updatedFileSize = 0;
		try {

			List<Map<String, Object>> updatedFileList = fileUploadUtil2.fileupload(request,
					ConstUtil.UPLOAD_IMAGE_FLAG);

			for (Map<String, Object> map : updatedFileList) {
				updatedFileName = (String) map.get("fileName");
				updatedOriginalFileName = (String) map.get("originalFileName");
				updatedFileSize = (long) map.get("fileSize");

				sbVo.setBookImgName(updatedFileName);
				sbVo.setBookImgOriginalname(updatedOriginalFileName);
				sbVo.setBookImgSize(updatedFileSize);
			} // for

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		String msg = "수정 처리완료", url = "/admin/book/bookEdit?bookNo=" + sbVo.getBookNo();
		int cnt = bookService.updateBook(sbVo);

		if (cnt > 0) {

			// 새로 업로드했고 기존 파일이 존재한다면 업로드폴더에서 기존 파일 삭제하기
			if (updatedFileName != null && !updatedFileName.isEmpty()) {// 새로 첨부했고
				if (oldFileName != null && !oldFileName.isEmpty()) { // 기존 파일이 존재한다면
					String fileUploadPath = fileUploadUtil2.getUploadPath(request, ConstUtil.UPLOAD_IMAGE_FLAG);
					File file = new File(fileUploadPath, oldFileName);
					if (file.exists()) {
						Boolean bool = file.delete();
						logger.info("삭제함? : bool={}, 삭제한 기존 파일명 oldFileName={}", bool, oldFileName);
					}
				}
			}

		} else {
			url = "/admin/book/bookEdit?bookNo=" + sbVo.getBookNo();
			msg = "수정 실패...";
		}
		// 3
		model.addAttribute("title", "책 수정 처리 중");
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);

		// 4
		/* return "redirect:/admin/book/bookList"; */
		return "common/message";
	}

	@RequestMapping("/bookSummingUp")
	public String bookSummingUp(Model model) {
		logger.info("책관리 페이지 - 책 매출현황 페이지입니다.");
		
		String strSum =  bookService.showMainSum();
		model.addAttribute("title", "책 매출현황 페이지");
		model.addAttribute("strSum", strSum);

		return "admin/book/bookSummingUp";
	}

	@RequestMapping("/deleteMulti")
	public String deleteMulti(@ModelAttribute StockBookVOList listvo, HttpServletRequest request, Model model) {
		// 1
		logger.info("선택한 책 삭제, 파라미터 listvo={}", listvo);

		// 2. db
		List<StockBookVO> list = listvo.getStockBookItems();
		int cnt = bookService.deleteMulti(list);
		logger.info("선택한 상품 삭제 결과, cnt={}", cnt);
		String msg = "", url = "/admin/book/bookList?bookFlag=bookList";

		if (cnt > 0) {
			msg = "선택한 상품들을 삭제했습니다";

			String uploadPath = fileUploadUtil2.getUploadPath(request, ConstUtil.UPLOAD_IMAGE_FLAG);

			for (int i = 0; i < list.size(); i++) {
				StockBookVO vo = list.get(i);

				int bookNo = vo.getBookNo();
				String fileName = vo.getBookImgName();

				logger.info("i={}, bookNo={}", i, bookNo);
				logger.info("i={}, fileName={}", i, fileName);

				// 업로드한 이미지 파일 삭제 처리
				if (bookNo != 0) { // 선택한 상품만 삭제
					File file = new File(uploadPath, fileName);
					if (file.exists()) {
						boolean bool = file.delete();
						logger.info("파일 삭제 여부 : {}", bool);
					}
				} // if
			} // for
		} else {
			msg = "선택한 상품 삭제 중 에러가 발생했습니다.";
		}
		// 3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		// 4
		return "common/message";
	}
	
	@RequestMapping("/updateMulti")
	public String updateMulti(@ModelAttribute StockBookVOList listvo, HttpServletRequest request, Model model) {
		// 1
		logger.info("선택한 책 qty수정, 파라미터 listvo={}", listvo);

		// 2. db
		List<StockBookVO> list = listvo.getStockBookItems();
		int cnt = bookService.deleteMulti(list);
		logger.info("선택한 상품 qty 수정 결과, cnt={}", cnt);
		String msg = "", url = "/admin/book/bookList?bookFlag=Inventory";

		if (cnt > 0) {
			msg = "선택한 상품들의 qty를 수정했습니다";

		} else {
			msg = "선택한 상품 qty 수정 중 에러가 발생했습니다.";
		}
		// 3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		// 4
		return "common/message";
	}

	@ResponseBody
	@RequestMapping("/bookAjaxUpdateQty")
	public int bookAjaxUpdateQty(@ModelAttribute StockBookVO vo, HttpServletRequest request, Model model) {
		// 1
		logger.info("선택한 상품 QTY 수정하기, 파라미터 vo={}", vo);

		// 2. db
		int cnt = bookService.updateQty(vo);
		logger.info("선택한 상품 QTY 수정 결과, cnt={}", cnt);
		
		// 3
		// 4
		
		return cnt;
	}

	@ResponseBody
	@RequestMapping("/bookAjaxDelete")
	public int bookAjaxDelete(@RequestParam(defaultValue = "0") int bookNo) {
		logger.info("상품 개별 삭제하기, 파라미터 bookNo={}", bookNo);
		
		int cnt = bookService.deleteBook(bookNo);

		return cnt;
	}
	
  @GetMapping("/Excel")
   public void Excel(HttpServletResponse response)throws IOException {
	  logger.info("상품 전체 리스트 엑셀로 저장 처리");

      List<Map<String, Object>> bookList = bookService.selectBookByNo2();
      
      Workbook workbook = new XSSFWorkbook();
      Sheet sheet = workbook.createSheet("Sheet1"); // 엑셀 sheet 이름
      
      // 컬럼 셋팅
      Row headerRow = ((org.apache.poi.ss.usermodel.Sheet) sheet).createRow(0);
      headerRow.createCell(4).setCellValue("상품 코드");
      headerRow.createCell(5).setCellValue("상품명");
      headerRow.createCell(6).setCellValue("카테고리");
      headerRow.createCell(7).setCellValue("판매가");
      headerRow.createCell(8).setCellValue("등록일");
      // Populate data rows
      int rowNum = 1;
      
      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd [HH:mm]");
      for (Map<String, Object> map : bookList) {
    	 BigDecimal bigdecimal = (BigDecimal)map.get("BOOK_NO");
         Row row = sheet.createRow(rowNum++);
         
         //컬럼 폭 조절
         sheet.setColumnWidth(4, 10 * 256);
         sheet.setColumnWidth(5, 50 * 256);
         sheet.setColumnWidth(6, 10 * 256);
         sheet.setColumnWidth(7, 10 * 256);
         sheet.setColumnWidth(8, 20 * 256);
         
         //값 세팅
         row.createCell(4).setCellValue(bigdecimal.doubleValue());
         row.createCell(5).setCellValue((String)map.get("BOOK_TITLE"));
         row.createCell(6).setCellValue((String)map.get("BOOK_CATEGORY"));
         bigdecimal=(BigDecimal)map.get("BOOK_PRICE");
         row.createCell(7).setCellValue(bigdecimal.doubleValue());
         Date date=(Date)map.get("BOOK_REGDATE");
         row.createCell(8).setCellValue(dateFormat.format(date));
      }
      
      // Set response headers
      response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
      response.setHeader("Content-Disposition", "attachment; filename=_book_data.xlsx");

      // Write workbook data to response output stream
      OutputStream outputStream = response.getOutputStream();
      workbook.write(outputStream);
      workbook.close();
      outputStream.close();
   }
  
	@ResponseBody
	@RequestMapping("/showDaySumPrice")
	public String showDaySumPrice2(@RequestParam(required = false) String salesRegdate,
			@RequestParam(required = false)String bookFlag, Model model) {
		logger.info("관리자 페이지 - 책 판매 통계 보기, 파라미터 salesRegdate={}, bookFlag={}", salesRegdate, bookFlag);
		
		String sum = bookService.selectSalesSumbyDay(salesRegdate);
		logger.info("sum=", sum);
		
		return sum;
	}
	
}//
