package com.team2.mbti.intoStock.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IntoStockDAO {
	int insertIntoStock(IntoStockVO vo);
	int selectIntoStockQty(IntoStockVO vo);
	int updateIntoStockQty(IntoStockVO vo);
}
