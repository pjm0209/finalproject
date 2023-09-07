package com.team2.mbti.main.order.model;

import java.util.List;
import java.util.Map;

public interface MainOrderService {
	List<MainOrderVO> selectOrderDetailList(int ordersNo);
	List<Map<String, Object>> selectOrderList(int no);
}