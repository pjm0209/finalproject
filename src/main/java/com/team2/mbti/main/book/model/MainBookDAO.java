package com.team2.mbti.main.book.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainBookDAO {
	List<MainStockBookVO> selectBookAll(String searchKeyword);
	List<MainBookVO> selectByCategory(MainBookVO vo);
	
	MainBookVO selectBookByNo(int bookNo);
}
