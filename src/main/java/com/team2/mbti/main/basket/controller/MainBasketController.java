package com.team2.mbti.main.basket.controller;

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

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main/book/basket")
public class MainBasketController {
	private static final Logger logger = LoggerFactory.getLogger(MainBasketController.class);

	private final MainBasketService mainBasketService;

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

/*
	@PostMapping("/editCartQty2")
	//public String editCartQty(@RequestParam(defaultValue = "0")int cartNo) {
	public int editCartQty2(@ModelAttribute CartVO vo) {
		//1
		logger.info("장바구니 수량 수정처리하기, 파라미터 vo={}", vo);
		//2
		int cnt = cartService.editCartQty(vo);
		logger.info("장바구니 수량 수정 결과, cnt={}", cnt);
		
		CartVO cartVo = null;
		if(cnt > 0) {
			cartVo = cartService.selectCartByCartNo(cnt);
		}
		int qty = cartVo.getQuantity();
		//3
		//4
		return qty;
	}
	*/
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
	/*
	 * @RequestMapping("/bookBasket") public String
	 * bookBasket(@RequestParam(defaultValue = "0") int bookNo, Model model) {
	 * logger.info("책 주문 페이지 - bookBasket, 파라미터 bookNo={}", bookNo);
	 * 
	 * return "main/book/basket/bookBasket"; }
	 */

	
	/*
	 * @RequestMapping("/bookOrderMain") public String
	 * bookOrderMain(@RequestParam(defaultValue = "0") int bookNo, Model model) {
	 * logger.info("책 주문 페이지 1단계(장바구니) - bookOrderMain, 파라미터 bookNo={}", bookNo);
	 * List<Map<String, Object>> list =
	 * mainBasketService.selectBasketBookView(bookNo); model.addAttribute("mapList",
	 * list); return "main/book/basket/bookOrderMain"; }
	 */
	
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
	public String bookOrderComplete(@RequestParam(defaultValue = "0") int bookNo, Model model) {
		logger.info("책 주문 페이지 3단계(결제 내역 확인) - bookOrderComplete, 파라미터 bookNo={}", bookNo);
		
		//전부 트랜젝션으로
		
		//1. insert
		// - orders
		// - orders_detail
		// - sales(SALES_CATEGORY_NO, SALES_PRICE, SALES_NAME) * 구매한 제품마다 각각
		// - intoStock 구매한 제품마다 각각
		
		//2. delete
		// - basket
		
		return "main/book/basket/bookOrderComplete";
	}
	
}//
