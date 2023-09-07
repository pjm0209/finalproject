package com.team2.mbti.main.order.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainOrderDAO {
	List<MainOrderVO> selectOrderDetailList(int ordersNo);
	List<Map<String, Object>> selectOrderList(int no);
}