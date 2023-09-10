package com.team2.mbti.book.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.team2.mbti.intoStock.model.IntoStockDAO;
import com.team2.mbti.intoStock.model.IntoStockVO;
import com.team2.mbti.sales.model.SalesDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class BookServiceImpl implements BookService {
	private static final Logger logger = LoggerFactory.getLogger(BookServiceImpl.class);
	private final BookDAO bookDao;
	private final IntoStockDAO intoStockDao;
	private final SalesDAO salesDao;

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

		int cnt = 0;
		try {
			bookDao.insertBook(vo);
			IntoStockVO vo2 = new IntoStockVO();
			vo2.setIntoStockQty(vo.getStockQty());
			vo2.setBookNo(vo.getBookNo());
			cnt = intoStockDao.insertIntoStock(vo2);
		} catch (RuntimeException e) {
			// 선언적 트랜잭션에서는 런타임 예외가 발생하면 롤백한다
			e.printStackTrace();
			cnt = -1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly(); // 롤백하기
		}

		return cnt;
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

	@Override
	public int updateMulti(List<StockBookVO> list) {
		int cnt = 0;
		int result = 0;
		try {
			for (StockBookVO vo : list) {
				int bookNo = vo.getBookNo();

				int originalQty = bookDao.selectIntoStockQty(bookNo);

				int userInputQty = vo.getStockQty();


				if (bookNo != 0) { // 체크된 상품만 삭제
					result = userInputQty-originalQty;
					logger.info("userInputQty-originalQty result={}", result);
					
					IntoStockVO isVo = new IntoStockVO();
					logger.info("22 result={}", result);
					isVo.setIntoStockQty(result);
					isVo.setBookNo(bookNo);
					logger.info("isVo={}", isVo);
					cnt = intoStockDao.insertIntoStock(isVo);
					logger.info("cnt={}", cnt);
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

	@Override
	public int deleteBook(int bookNo) {
		return bookDao.deleteBook(bookNo);
	}

	@Override
	public int updateQty(StockBookVO vo) {
		logger.info("serviceImpl시작");
		int cnt = 0;
		int result = 0;

		int bookNo = vo.getBookNo();
		logger.info("bookNo={}", bookNo);
		int originalQty = bookDao.selectIntoStockQty(bookNo);
		logger.info("originalQty={}", originalQty);
		int userInputQty = vo.getStockQty();
		logger.info("userInputQty={}", userInputQty);
		/*
		if (originalQty > userInputQty) { // 100 ,7
			result = userInputQty-originalQty; //-93
			logger.info("if문 originalQty > userInputQty result={}", result);
		} else if (originalQty < userInputQty) { //100, 200
			result = userInputQty - originalQty; //200-100=100
			logger.info("if문 originalQty < userInputQty result={}", result);
		}*/
		result = userInputQty-originalQty;
		logger.info("userInputQty-originalQty result={}", result);
		
		IntoStockVO isVo = new IntoStockVO();
		logger.info("22 result={}", result);
		isVo.setIntoStockQty(result);
		isVo.setBookNo(bookNo);
		logger.info("isVo={}", isVo);
		cnt = intoStockDao.insertIntoStock(isVo);
		logger.info("cnt={}", cnt);

		return cnt;
	}


}//
