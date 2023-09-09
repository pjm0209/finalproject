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
	private OrdersDAO ordersDao;
	private static final Logger logger = LoggerFactory.getLogger(OrdersServiceImpl.class);

	@Override
	public List<Map<String, Object>> selectAllAjaxOrderList(OrderVO vo) {
		return ordersDao.selectAllAjaxOrderList(vo);
	}

	@Override
	public int selectOrdersCnt(OrderVO vo) {
		return ordersDao.selectOrdersCnt(vo);
	}
	
	
}//
