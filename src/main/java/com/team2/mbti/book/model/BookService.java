package com.team2.mbti.book.model;

import java.util.List;

public interface BookService {
	List<BookVO> selectBookAll(BookVO vo);
	int selectBookCnt();
	List<BookVO> selectByConditions(BookVO vo);
}
