package com.team2.mbti.main.book.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainBookServiceImpl implements MainBookService{
	private final MainBookDAO mainBookDao;
	private static final Logger logger = LoggerFactory.getLogger(MainBookServiceImpl.class);
	
	@Override
	public List<MainStockBookVO> selectBookAll(String searchKeyword) {
		return mainBookDao.selectBookAll(searchKeyword);
	}
	@Override
	public List<MainBookVO> selectByCategory(MainBookVO vo) {
		return mainBookDao.selectByCategory(vo);
	}
	@Override
	public MainBookVO selectBookByNo(int bookNo) {
		return mainBookDao.selectBookByNo(bookNo);
	}
	
	
}//
