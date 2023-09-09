package com.team2.mbti.order.model;

import java.util.List;
import java.util.Map;

public interface OrdersService {
	List<Map<String, Object>> selectAllAjaxOrderList(OrderVO vo);
	int selectOrdersCnt(OrderVO vo);
	
	
}//
