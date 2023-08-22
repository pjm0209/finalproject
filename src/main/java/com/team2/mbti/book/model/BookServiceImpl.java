package com.team2.mbti.book.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BookServiceImpl implements BookService {
	private final BookDAO bookDao;

	@Override
	public List<BookVO> selectBookAll(BookVO vo) {
		return bookDao.selectBookAll(vo);
	}

	@Override
	public int selectBookCnt() {
		return bookDao.selectBookCnt();
	}

	@Override
	public List<BookVO> selectByConditions(BookVO vo) {
		return bookDao.selectByConditions(vo);
	}
	
}//
