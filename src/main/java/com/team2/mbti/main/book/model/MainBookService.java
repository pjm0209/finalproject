package com.team2.mbti.main.book.model;

import java.util.List;

public interface MainBookService {
	List<MainBookVO> selectBookAll(MainBookVO vo);
	List<MainBookVO> selectByCategory(MainBookVO vo);
	int selectBookAllCnt(MainBookVO vo);
	MainBookVO selectBookByNo(int bookNo);
	int selectByCategoryCnt(MainBookVO vo);
}
