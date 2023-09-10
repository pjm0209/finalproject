package com.team2.mbti.book.model;

import java.util.List;
import java.util.Map;

public interface BookService {
	List<Map<String, Object>> selectBookAll(StockBookVO vo);
	List<StockBookVO> selectBookAllAjax(StockBookVO vo);
	int selectBookCnt(StockBookVO vo);
	
	int insertBook(StockBookVO vo);
	
	StockBookVO selectBookByNo(int bookNo);
	
	int updateBook(StockBookVO vo);
	int updateQty(StockBookVO vo);
	int deleteBook(int bookNo);
	int deleteMulti(List<StockBookVO> list);
	
	int updateMulti(List<StockBookVO> list);
	String selectSalesSumbyDay(String salesRegdate);
	String showMainSum();
	
	List<Map<String, Object>> selectBookByNo2();
}//
