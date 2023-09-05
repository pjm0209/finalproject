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

import com.team2.mbti.common.ConstUtil;
import com.team2.mbti.main.basket.model.MainBasketService;
import com.team2.mbti.main.basket.model.MainBasketVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
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

	@RequestMapping("/basketList")
	public String basketList(HttpSession session,Model model) {
		//1
		String no = (String) session.getAttribute("no");
		logger.info("장바구니 리스트, 파라미터 회원번호 no={}", no);
		//2
		List<Map<String, Object>> list
		= mainBasketService.selectBasketBookView(Integer.parseInt(no));
		logger.info("장바구니 리스트 조회 결과, list.size()={}", list.size());
		//3
		model.addAttribute("list", list);
	  
		model.addAttribute("DELIVERY", ConstUtil.DELIVERY);
		model.addAttribute("TOTAL_PRICE", ConstUtil.TOTAL_PRICE); //4
		return "main/book/basket/bookOrderMain";
	  
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
	
	@RequestMapping("/editCartQty")
	public String editCartQty(@ModelAttribute CartVO vo) {
		//1
		logger.info("장바구니 수량 수정처리하기, 파라미터 vo={}", vo);
		//2
		int cnt = cartService.editCartQty(vo);
		logger.info("장바구니 수량 수정  결과, cnt={}", cnt);
		//3
		//4
		return "redirect:/shop/cart/cartList";
	}
	
	@RequestMapping("/deleteCart")
	public String deleteCart(@RequestParam(defaultValue = "0")int cartNo) {
		//1
		logger.info("장바구니 삭제 처리하기, 파라미터 cartNo={}", cartNo);
		//2
		int cnt = cartService.deleteCart(cartNo);
		logger.info("장바구니 삭제 처리 결과, cnt={}", cnt);
		//3
		//4
		return "redirect:/shop/cart/cartList";
	}*/
	
	@RequestMapping("/bookBasket")
	public String bookBasket(@RequestParam(defaultValue = "0") int bookNo, Model model) {
		logger.info("책 주문 페이지 - bookBasket, 파라미터 bookNo={}", bookNo);

		return "main/book/basket/bookBasket";
	}

	
	@RequestMapping("/bookOrderMain")
	public String bookOrderMain(@RequestParam(defaultValue = "0") int bookNo, Model model) {
		logger.info("책 주문 페이지 - bookOrderMain, 파라미터 bookNo={}", bookNo);

		return "main/book/basket/bookOrderMain";
	}

	@RequestMapping("/bookOrdering")
	public String bookOrdering(@RequestParam(defaultValue = "0") int bookNo, Model model) {
		logger.info("책 주문 페이지 - bookOrderMain, 파라미터 bookNo={}", bookNo);

		return "main/book/basket/bookOrdering";
	}
	
	@RequestMapping("/bookOrderComplete")
	public String bookOrderComplete(@RequestParam(defaultValue = "0") int bookNo, Model model) {
		logger.info("책 주문 페이지 - bookOrderComplete, 파라미터 bookNo={}", bookNo);

		return "main/book/basket/bookOrderComplete";
	}
	
}//
