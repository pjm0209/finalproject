package com.team2.mbti.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.mbti.book.controller.BookController;
import com.team2.mbti.common.ConstUtil;
import com.team2.mbti.common.PaginationInfo;
import com.team2.mbti.order.model.OrdersService;
import com.team2.mbti.order.model.SortOrderViewVO;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/order")
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(BookController.class); 
	private final OrdersService ordersService; 
	
	@ResponseBody
	@RequestMapping("/orderAjaxOrderList")
	public Map<String, Object> orderAjaxOrderList(@ModelAttribute SortOrderViewVO vo,
			HttpServletRequest request, Model model) {
		// 1
		logger.info("책관리 페이지 - 주문내역 리스트 페이지입니다.,파라미터 SortOrderViewVO={}", vo);
		logger.info("ajax 이용 - ajaxList");

		Map<String, Object> map = new HashMap<>();
		// 2
		//
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(vo.getCurrentPage());

		logger.info("vo.getCurrentPage()={}", vo.getCurrentPage());
		logger.info("pagingInfo.getCurrentPage()={}", pagingInfo.getCurrentPage());

		String flag = request.getParameter("flag");
		
		if (flag.equals("order")) {
			pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
			vo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		} else if (flag.equals("orderByKeyword")) {
			pagingInfo.setRecordCountPerPage(vo.getPerRecord());
			vo.setRecordCountPerPage(vo.getPerRecord());
			logger.info(" 레코드 확인용 SortOrderViewVO={}", vo);
		} /*
			 * else if (flag.equals("orderCancle")) {
			 * pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
			 * vo.setRecordCountPerPage(ConstUtil.RECORD_COUNT); } else if
			 * (flag.equals("orderCancleyByKeyword")) {
			 * pagingInfo.setRecordCountPerPage(vo.getPerRecord());
			 * vo.setRecordCountPerPage(vo.getPerRecord()); }
			 */

		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("변경 후 SortOrderViewVO={}", vo);

		List<SortOrderViewVO> list = ordersService.selectAllAjaxOrderList(vo);
		logger.info("관리자 페이지 - 주문 리스트 ajax 검색결과 list.size()={}", list.size());

		int totalRecord = ordersService.selectOrdersCnt(vo);
		logger.info("주문 전체 개수 조회 결과 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("pagingInfo 객체, pagingInfo={}", pagingInfo);
		
		map.put("list", list);
		map.put("flag", flag);
		map.put("pagingInfo", pagingInfo);
		
		return map;
	}
	
	
	@RequestMapping("/orderList")
	public String orderList(HttpServletRequest request, Model model) {
		String flag = request.getParameter("flag");
		logger.info("책관리 페이지 - 주문 리스트 페이지입니다.,파라미터 flag={}", flag);

		String url = "admin/order/orderList?flag=" + flag;

		if ((flag != null && !flag.isEmpty())
				&& (flag.equals("order") || flag.equals("orderByKeyword"))){
			logger.info("url={}", url);
		} else {

			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/index");

			return "common/message";
		}
		
			model.addAttribute("title", "주문 관리");
		
		return "admin/order/orderList";
	}
	
	@RequestMapping("/orderCancleList")
	public String orderCancleList(Model model) {
		logger.info("주문관리 페이지 - 주문 취소 리스트 페이지입니다.");
		
		model.addAttribute("title", "주문 취소 리스트 페이지");
		
		return "admin/order/orderCancleList";
	}
	
	@RequestMapping("/orderDetail")
	public String orderDetail(Model model) {
		logger.info("주문관리 페이지 - 주문 상세보기 페이지입니다.");
		
		model.addAttribute("title", "주문 상세보기 페이지");
		
		return "admin/order/orderDetail";
	}
	
}
