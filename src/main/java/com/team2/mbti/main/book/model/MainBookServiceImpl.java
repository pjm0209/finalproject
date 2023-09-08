package com.team2.mbti.main.book.model;

import java.util.List;
import java.util.Map;

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
	public List<MainBookVO> selectBookAll(MainBookVO vo) {
		return mainBookDao.selectBookAll(vo);
	}
	@Override
	public List<MainBookVO> selectByCategory(MainBookVO vo) {
		return mainBookDao.selectByCategory(vo);
	}
	@Override
	public MainBookVO selectBookByNo(int bookNo) {
		return mainBookDao.selectBookByNo(bookNo);
	}
	@Override
	public int selectByCategoryCnt(MainBookVO vo) {
		return mainBookDao.selectByCategoryCnt(vo);
	}
	@Override
	public int selectBookAllCnt(MainBookVO vo) {
		return mainBookDao.selectBookAllCnt(vo);
	}
	@Override
	public List<Map<String, Object>> selectBest4(String bookCategory) {
		return mainBookDao.selectBest4(bookCategory);
	}
	@Override
	public List<Map<String, Object>> best3(String bookCategory) {
		return mainBookDao.best3(bookCategory);
	}
	
	
}//
