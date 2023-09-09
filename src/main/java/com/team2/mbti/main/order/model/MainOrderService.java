package com.team2.mbti.main.order.model;

import java.util.List;
import java.util.Map;

public interface MainOrderService {
	List<Map<String, Object>> selectOrderList(int no);
	int findCurrentOrdersNo(int no);
	List<Map<String, Object>> selectMyCurrentOrder(int ordersNo);
	
	void deleteOrders(Map<String, String> map);
	
	int selectCntOrdersState(MainOrdersDetailVO vo);
}