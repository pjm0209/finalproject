package com.team2.mbti.order.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrdersDAO {
	
	List<Map<String, Object>> selectAllAjaxOrderList(OrderVO vo);	
	int selectOrdersCnt(OrderVO vo);
}//
