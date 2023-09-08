package com.team2.mbti.main.order.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.team2.mbti.intoStock.model.IntoStockDAO;
import com.team2.mbti.intoStock.model.IntoStockVO;
import com.team2.mbti.main.basket.controller.MainBasketController;
import com.team2.mbti.main.basket.model.MainBasketDAO;
import com.team2.mbti.main.book.model.MainBookVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainOrderServiceImpl implements MainOrderService {
	private final MainOrderDAO mainOrderDao;
	private final MainBasketDAO mainBasketDao;
	private final IntoStockDAO intoStockDao;

	private static final Logger logger = LoggerFactory.getLogger(MainBasketController.class);

	@Override
	public List<Map<String, Object>> selectOrderList(int no) {
		return mainOrderDao.selectOrderList(no);
	}

	@Override
	public int findCurrentOrdersNo(int no) {
		return mainOrderDao.findCurrentOrdersNo(no);
	}

	@Override
	public List<Map<String, Object>> selectMyCurrentOrder(int ordersNo) {
		return mainOrderDao.selectMyCurrentOrder(ordersNo);
	}


	@Override
	public void deleteOrders(Map<String, String> map) {
		logger.info("deleteOrders(ordersNo) 실행 시작");
		 mainOrderDao.deleteOrders(map);
		 logger.info("deleteOrders(ordersNo) 실행 종료");
	}

	@Override
	public int selectCntOrdersState(MainOrdersDetailVO vo) {
		return  mainOrderDao.selectCntOrdersState(vo);
	}
}//