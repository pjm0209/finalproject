package com.team2.mbti.book.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookDAO {
	List<BookVO> selectBookAll(BookVO vo);
	int selectBookCnt();
	List<BookVO> selectByConditions(BookVO vo);
}
