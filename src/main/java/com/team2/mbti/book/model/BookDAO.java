package com.team2.mbti.book.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookDAO {
	List<Map<String, Object>> selectBookAll(StockBookVO vo);
	int selectBookCnt(StockBookVO vo);
}//
