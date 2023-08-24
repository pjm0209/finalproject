package com.team2.mbti.book.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BookServiceImpl implements BookService {
	private final BookDAO bookDao;

	@Override
	public List<Map<String, Object>> selectBookAll(StockBookVO vo){
		return bookDao.selectBookAll(vo);
	}

	@Override
	public int selectBookCnt(StockBookVO vo) {
		return bookDao.selectBookCnt(vo);
	}

	
}//
