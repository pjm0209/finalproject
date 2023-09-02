package com.team2.mbti.book.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
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

	@Override
	public List<StockBookVO> selectBookAllAjax(StockBookVO vo) {
		return bookDao.selectBookAllAjax(vo);
	}

	@Override
	public int insertBook(StockBookVO vo) {
		return bookDao.insertBook(vo);
	}
	
}//
