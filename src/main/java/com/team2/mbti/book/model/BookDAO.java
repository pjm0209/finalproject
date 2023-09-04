package com.team2.mbti.book.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookDAO {
	List<Map<String, Object>> selectBookAll(StockBookVO vo);
	List<StockBookVO> selectBookAllAjax(StockBookVO vo);
	int selectBookCnt(StockBookVO vo);
	int insertBook(StockBookVO vo);
	StockBookVO selectBookByNo(int bookNo);
	
	int updateBook(StockBookVO vo);
	
	int deleteBook(int bookNo);
}//
