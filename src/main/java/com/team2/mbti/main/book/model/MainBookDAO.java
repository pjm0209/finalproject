package com.team2.mbti.main.book.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainBookDAO {
	List<MainBookVO> selectBookAll(MainBookVO vo);
	List<MainBookVO> selectByCategory(MainBookVO vo);
	int selectBookAllCnt(MainBookVO vo);
	MainBookVO selectBookByNo(int bookNo);
	List<Map<String, Object>> selectBest4(String bookCategory);
	int selectByCategoryCnt(MainBookVO vo);
	List<Map<String, Object>> best3(String bookCategory);
}
