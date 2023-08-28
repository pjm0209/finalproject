package com.team2.mbti.book.model;

import java.util.List;
import java.util.Map;

public interface BookService {
	List<Map<String, Object>> selectBookAll(StockBookVO vo);
	int selectBookCnt(StockBookVO vo);
}
