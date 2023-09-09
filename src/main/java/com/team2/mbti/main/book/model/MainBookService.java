package com.team2.mbti.main.book.model;

import java.util.List;
import java.util.Map;

public interface MainBookService {
	List<MainBookVO> selectBookAll(MainBookVO vo);
	List<MainBookVO> selectByCategory(MainBookVO vo);
	int selectBookAllCnt(MainBookVO vo);
	MainBookVO selectBookByNo(int bookNo);
	int selectByCategoryCnt(MainBookVO vo);
	
	List<Map<String, Object>> selectBest4(String bookCategory);
	List<Map<String, Object>> best3(String bookCategory);
	
}//
