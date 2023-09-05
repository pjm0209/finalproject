package com.team2.mbti.main.book.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainBookDAO {
	List<MainBookVO> selectBookAll(MainBookVO vo);
	List<MainBookVO> selectByCategory(MainBookVO vo);
	int selectBookAllCnt(MainBookVO vo);
	MainBookVO selectBookByNo(int bookNo);
	
	int selectByCategoryCnt(MainBookVO vo);
}
