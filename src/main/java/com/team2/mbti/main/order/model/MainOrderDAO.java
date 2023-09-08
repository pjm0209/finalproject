package com.team2.mbti.main.order.model;


import org.apache.ibatis.annotations.Mapper;

import com.team2.mbti.main.book.model.MainBookVO;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;

@Mapper
public interface MainOrderDAO {
	int insertOrders(MainOrderVO ovo);
	int insertOrderDetails(MainBookVO detailVo);
	int insertSales(MainBookVO Vo);
	List<Map<String, Object>> selectOrderDetailList(int ordersNo);
	List<Map<String, Object>> selectOrderList(int no);
	List<Map<String, Object>> selectMyCurrentOrder(int ordersNo);
	
	int findCurrentOrdersNo(int no);
	
	void deleteOrders(Map<String, String> map);
	
	int selectCntOrdersState(MainOrdersDetailVO vo);
}
