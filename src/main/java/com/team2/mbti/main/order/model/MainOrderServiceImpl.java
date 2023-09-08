package com.team2.mbti.main.order.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainOrderServiceImpl implements MainOrderService {
	private final MainOrderDAO mainOrderDao;

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
}