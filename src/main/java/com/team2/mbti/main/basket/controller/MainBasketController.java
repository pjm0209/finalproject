package com.team2.mbti.main.basket.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.mbti.common.ConstUtil;
import com.team2.mbti.main.basket.model.MainBasketService;
import com.team2.mbti.main.basket.model.MainBasketVO;
import com.team2.mbti.main.book.model.MainBookVO;
import com.team2.mbti.main.book.model.MainBookVOList;
import com.team2.mbti.main.order.model.MainOrderService;
import com.team2.mbti.main.order.model.MainOrderVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main/book/basket")
public class MainBasketController {
	private static final Logger logger = LoggerFactory.getLogger(MainBasketController.class);

	private final MainBasketService mainBasketService;
	private final MainOrderService mainOrderService;

	@RequestMapping("/basketInsert")
	public String basketInsert(@ModelAttribute MainBasketVO basketVo,
			@RequestParam String mode,HttpServletRequest request) {

		//String no = (String) session.getAttribute("no");
		int no = (int)request.getSession().getAttribute("no");		
		basketVo.setNo(no);

		logger.info("책 메인 페이지 - 장바구니 insert 처리하기");
		logger.info("장바구니 담기, 파라미터 basketVo={}, mode={}", basketVo, mode);

		int cnt = mainBasketService.insertBasket(basketVo);
		logger.info("장바구니 담기 결과, cnt={}", cnt);

		String resultPage = "";
		if (mode.equals("cart")) { // 장바구니 담기
			resultPage = "redirect:/main/book/basket/bookOrderMain";
		} else if (mode.equals("order")) { // 바로 구매
			resultPage = "redirect:/main/book/basket/bookOrdering";
		}

		return resultPage;

	}


	@ResponseBody
	@RequestMapping("/bookAjaxQty")
	public int bookAjaxQty(@ModelAttribute MainBasketVO vo) {
		//1
		logger.info("장바구니 수량 ajax 수정처리하기, 파라미터 vo={}", vo);
		//2
		int cnt = mainBasketService.editBasketQty(vo);
		logger.info("장바구니 수량 수정  결과, cnt={}", cnt);
		//3
		//4
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping("/bookAjaxDelete")
	public int bookAjaxDelete(@RequestParam(defaultValue = "0")int basketNo) {
		//1
		logger.info("장바구니 ajax 삭제 처리하기, 파라미터 basketNo={}", basketNo);
		//2
		int cnt = mainBasketService.deleteByBasketNo(basketNo);
		logger.info("장바구니 삭제 처리 결과, cnt={}", cnt);
		//3
		//4
		return cnt;
	}
	
	@RequestMapping("/bookOrderMain")
	public String bookOrderMain(HttpServletRequest request,Model model) {
		//1
		int no = (int)request.getSession().getAttribute("no");
		logger.info("장바구니 리스트, 파라미터 회원번호 no={}", no);
		//2
		List<Map<String, Object>> list
		= mainBasketService.selectBasketBookView(no);
		logger.info("장바구니 리스트 조회 결과, list.size()={}", list.size());
		//3
		model.addAttribute("mapList", list);
	  
		model.addAttribute("DELIVERY", ConstUtil.DELIVERY);
		model.addAttribute("TOTAL_PRICE", ConstUtil.TOTAL_PRICE);
		return "main/book/basket/bookOrderMain";
	  
	  }
	
	@RequestMapping("/bookOrdering")
	public String bookOrdering(HttpServletRequest request, Model model) {
		logger.info("책 주문 페이지 2단계(결제 전 주문 확인) - bookOrderMain");
		// 1
		int no = (int)request.getSession().getAttribute("no");
		logger.info("2단계(결제 전 주문 확인), 파라미터 회원번호 no={}", no);
		//2
		List<Map<String, Object>> list
		= mainBasketService.selectBasketBookView(no);
		logger.info("장바구니 조회 결과, list.size()={}", list.size());
		//3
		model.addAttribute("mapList", list);
	  
		model.addAttribute("DELIVERY", ConstUtil.DELIVERY);
		model.addAttribute("TOTAL_PRICE", ConstUtil.TOTAL_PRICE);
		
		return "main/book/basket/bookOrdering";
	}
	
	
	@RequestMapping("/bookOrderComplete")
	public String bookOrderComplete(@ModelAttribute MainOrderVO orderVo, @RequestParam(defaultValue = "0") int ordersNo,
			@ModelAttribute MainBookVOList bookListVo, Model model, HttpSession session) {
		if(ordersNo == 0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/main/index");

			return "common/message";
		}
		
		logger.info("책 주문 페이지 3단계(결제 내역 확인) - bookOrderComplete, 파라미터 orderVo={}", orderVo);
		logger.info("파라미터 bookListVo={}", bookListVo);
		int no = (int)session.getAttribute("no");
		logger.info("3단계(결제 완료 처리 중), 파라미터 회원번호 no={}", no);
		
		//전부 트랜젝션으로
		List<Map<String, Object>> list = new ArrayList<>();
		List<MainBookVO> bookList= bookListVo.getMainBookItems();
		orderVo.setNo(no);
		
		Map<String, Object> map = new HashMap<>();
		map.put("bookList", bookList);
		map.put("orderVo", orderVo);
		list.add(map);
		
		//1. insert
		// - orders
		// - orders_detail
		// - sales(SALES_CATEGORY_NO, SALES_PRICE, SALES_NAME) * 구매한 제품마다 각각
		// - intoStock 구매한 제품마다 각각
		int cnt = mainBasketService.insertOrdersAndEditOthers(list);
		logger.info("최종 insertOrdersAndEditOthers 결과 cnt={}",cnt);
		
		//2. delete
		// - basket
		if(cnt >= 1) {
			cnt = mainBasketService.completeOrders(no); // delete basket where no=?
			logger.info("장바구니 삭제 completeOrders 결과 cnt={}",cnt);
		} else {
			logger.info("장바구니 삭제 completeOrders 미실시");
		}
		
		logger.info("내 회원번호 ={}", no);
		int orderNo = mainOrderService.findCurrentOrdersNo(no);
		logger.info("방금 주문한 내역의 주문번호 ={}", orderNo);
		List<Map<String, Object>> currentOrderList = mainOrderService.selectMyCurrentOrder(orderNo);
		logger.info("주문번호로 조회한 주문 내역 currentOrderList.size()={}", currentOrderList.size());
		
		model.addAttribute("list", currentOrderList);
		model.addAttribute("DELIVERY", ConstUtil.DELIVERY);
		model.addAttribute("TOTAL_PRICE", ConstUtil.TOTAL_PRICE);
		
		return "main/book/basket/bookOrderComplete";
	}
	
	@ResponseBody
	@RequestMapping("/mainAjaxInsertBasket")
	public int mainAjaxInsertBasket(@RequestParam(defaultValue = "") String mode, HttpSession session, @ModelAttribute MainBasketVO vo) {
		int no = (int)session.getAttribute("no");
		logger.info("바탕화면에서 인가상품을 장바구니에 넣기 처리하기, 회원 번호 no={}, 파라미터 mode={}", no, mode);
		vo.setNo(no);
		
		logger.info("바탕화면에서 인가상품을 장바구니에 넣기 처리하기, 파라미터 vo={}", vo);
		int cnt = mainBasketService.insertBasket(vo);
		logger.info("바탕화면에서 인가상품을 장바구니에 넣기 결과 cnt={}", cnt);
		return cnt;
	}
	
}//
