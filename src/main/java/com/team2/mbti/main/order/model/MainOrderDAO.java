package com.team2.mbti.main.order.model;

import org.apache.ibatis.annotations.Mapper;

import com.team2.mbti.main.book.model.MainBookVO;

@Mapper
public interface MainOrderDAO {
	int insertOrders(MainOrderVO ovo);
	int insertOrderDetails(MainBookVO Vo);
	int insertSales(MainBookVO Vo);
}
