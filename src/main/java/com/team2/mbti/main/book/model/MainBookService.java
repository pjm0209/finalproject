package com.team2.mbti.main.book.model;

import java.util.List;

public interface MainBookService {
	List<MainStockBookVO> selectBookAll(String searchKeyword);
	List<MainBookVO> selectByCategory(MainBookVO vo);
	
	MainBookVO selectBookByNo(int bookNo);
}
