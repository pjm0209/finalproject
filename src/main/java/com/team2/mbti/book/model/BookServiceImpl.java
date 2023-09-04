package com.team2.mbti.book.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class BookServiceImpl implements BookService {
	private static final Logger logger = LoggerFactory.getLogger(BookServiceImpl.class);
	private final BookDAO bookDao;

	@Override
	public List<Map<String, Object>> selectBookAll(StockBookVO vo) {
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
	public StockBookVO selectBookByNo(int bookNo) {
		return bookDao.selectBookByNo(bookNo);
	}

	@Override
	public int updateBook(StockBookVO vo) {
		return bookDao.updateBook(vo);
	}

	@Override
	public int insertBook(StockBookVO vo) {

		return bookDao.insertBook(vo);
	}

	@Override
	public int deleteMulti(List<StockBookVO> list) {
		int cnt = 0;

		try {
			for (StockBookVO vo : list) {
				int bookNo = vo.getBookNo();
				if (bookNo != 0) { // 체크된 상품만 삭제
					cnt = bookDao.deleteBook(bookNo);
				}
			} // for
		} catch (RuntimeException e) {
			// 선언적 트랜잭션에서는 런타임 예외가 발생하면 롤백한다
			e.printStackTrace();
			cnt = -1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly(); // 롤백하기
		}

		return cnt;
	}

}//
