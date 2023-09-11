package com.team2.mbti.main.basket.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.team2.mbti.book.model.StockBookVO;
import com.team2.mbti.intoStock.model.IntoStockDAO;
import com.team2.mbti.intoStock.model.IntoStockVO;
import com.team2.mbti.main.basket.controller.MainBasketController;
import com.team2.mbti.main.book.model.MainBookVO;
import com.team2.mbti.main.order.model.MainOrderDAO;
import com.team2.mbti.main.order.model.MainOrderVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class MainBasketServiceImpl implements MainBasketService {
	private final MainBasketDAO mainBasketDao;
	private final MainOrderDAO mainOrderDao;
	private final IntoStockDAO intoStockDao;

	private static final Logger logger = LoggerFactory.getLogger(MainBasketController.class);

	@Override
	public int insertBasket(MainBasketVO vo) {
		int count = mainBasketDao.selectCountBasket(vo);
		logger.info("장바구니에 동일항목있는지 검사 후 그 결과는 count={}", count);

		int cnt = 0;
		if (count > 0) { // 해당 사용자가 이미 장바구니에 담은 상품이 존재하면 수량만 update
			cnt = mainBasketDao.updateBasketQty(vo);
			logger.info("장바구니 수량 update 결과 ,cnt={}", cnt);
		} else {
			cnt = mainBasketDao.insertBasket(vo);
			logger.info("장바구니 insert 결과 ,cnt={}", cnt);
		}

		return cnt;
	}

	@Override
	public List<Map<String, Object>> selectBasketBookView(int no) {
		return mainBasketDao.selectBasketBookView(no);
	}

	@Override
	public int selectCountBasket(MainBasketVO vo) {
		return mainBasketDao.selectCountBasket(vo);
	}

	@Override
	public int updateBasketQty(MainBasketVO vo) {
		return mainBasketDao.updateBasketQty(vo);
	}

	@Override
	public int deleteByBasketNo(int basketNo) {
		return mainBasketDao.deleteByBasketNo(basketNo);
	}

	@Override
	public int editBasketQty(MainBasketVO vo) {
		return mainBasketDao.editBasketQty(vo);
	}

	@Override
	public int deleteCartByNo(int no) {
		return mainBasketDao.deleteCartByNo(no);
	}

	@Override
	public MainBasketVO selectCartByCartNo(int basketNo) {
		return mainBasketDao.selectCartByCartNo(basketNo);
	}

	@Override
	public int insertOrdersAndEditOthers(List<Map<String, Object>> list) {
		// 전부 트랜젝션으로

		// 1. insert
		// - orders
		// - orders_detail
		// - sales(SALES_CATEGORY_NO, SALES_PRICE, SALES_NAME) * 구매한 제품마다 각각
		// - intoStock 구매한 제품마다 각각

		// 2. delete
		// - basket
		int cnt = 0;
		
		List<MainBookVO> bookList = null;
		MainOrderVO orderVo = null;
		try {
			logger.info("insertOrdersAndEditOthers 시작");
			for (Map<String, Object> map  : list) {
				bookList  = (List<MainBookVO>)map.get("bookList");
				orderVo  = (MainOrderVO)map.get("orderVo");
			}
				cnt = mainOrderDao.insertOrders(orderVo);
				logger.info("insertOrders 결과 cnt={}",cnt);
			for(MainBookVO bookVo : bookList) {
				bookVo.setOrdersNo(orderVo.getOrdersNo());
				
				cnt = mainOrderDao.insertOrderDetails(bookVo);
				logger.info("insertOrderDetails 결과 cnt={}",cnt);
				cnt = mainOrderDao.insertSales(bookVo);
				logger.info("insertSales 결과 cnt={}",cnt);
				
				IntoStockVO intoStockVo = new IntoStockVO();
				intoStockVo.setBookNo(bookVo.getBookNo());
				intoStockVo.setIntoStockQty((bookVo.getOrdersQty()*(-1)));
	
				cnt = intoStockDao.insertIntoStock(intoStockVo);
				logger.info("insertIntoStock 결과 cnt={}",cnt);
			}
			
		} catch (RuntimeException e) {
			// 선언적 트랜잭션에서는 런타임 예외가 발생하면 롤백한다
			e.printStackTrace();
			cnt = -1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly(); // 롤백하기
		}
		
		return cnt;
	}

	@Override
	public int deleteBasketBook(MainBasketVO vo) {
		return mainBasketDao.deleteBasketBook(vo);
	}

	@Override
	public int completeOrders(int no) {
		return mainBasketDao.completeOrders(no);
	}

	@Override
	public List<Map<String, Object>> selectMyCurrentOrder(int ordersNo) {
		
		return mainOrderDao.selectMyCurrentOrder(ordersNo);
	}

	@Override
	public int deleteMultiBasket(List<MainBasketVO> list) {
		int cnt = 0;

		try {
			for (MainBasketVO vo : list) {
				int basketNo = vo.getBasketNo();
				if (basketNo != 0) { // 체크된 상품만 삭제
					cnt = mainBasketDao.deleteByBasketNo(basketNo);
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
	

};
