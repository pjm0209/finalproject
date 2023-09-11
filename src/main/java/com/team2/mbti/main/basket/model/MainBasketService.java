package com.team2.mbti.main.basket.model;

import java.util.List;
import java.util.Map;

import com.team2.mbti.main.order.model.MainOrderVO;

public interface MainBasketService {
	
	int insertBasket(MainBasketVO vo);
	List<Map<String, Object>> selectBasketBookView(int no);
	int selectCountBasket(MainBasketVO vo);
	
	int updateBasketQty(MainBasketVO vo);
	int deleteByBasketNo(int basketNo);
	
	int editBasketQty(MainBasketVO vo);
	int deleteBasketBook(MainBasketVO vo);
	int deleteCartByNo(int no);
	MainBasketVO selectCartByCartNo(int basketNo);
	
	int completeOrders(int no);
	
	int insertOrdersAndEditOthers(List<Map<String, Object>> list);
	
	List<Map<String, Object>> selectMyCurrentOrder(int ordersNo);
	int deleteMultiBasket(List<MainBasketVO> list);
}//
