package com.team2.mbti.order.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrdersDAO {
	
	List<SortOrderViewVO> selectAllAjaxOrderList(SortOrderViewVO vo);	
	int selectOrdersCnt(SortOrderViewVO vo);
	int updateAjaxState(OrdersDetailVO vo);
	List<Map<String, Object>> selectOrdersByNo(int ordersNo);
	int updateAjaxRecipient(OrderVO vo);
	int updateStateMulti(List<SortOrderViewVO> list, String ordersState);
}//
