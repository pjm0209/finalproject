package com.team2.mbti.order.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrdersServiceImpl implements OrdersService{
	private final OrdersDAO ordersDao;
	private static final Logger logger = LoggerFactory.getLogger(OrdersServiceImpl.class);

	@Override
	public List<SortOrderViewVO> selectAllAjaxOrderList(SortOrderViewVO vo){
		logger.info("ajax로 주문리스트 불러오기 시작");
		return ordersDao.selectAllAjaxOrderList(vo);
	}

	@Override
	public int selectOrdersCnt(SortOrderViewVO vo) {
		return ordersDao.selectOrdersCnt(vo);
	}
	
	
}//
