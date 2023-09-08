package com.team2.mbti.sales.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SalesServiceImpl implements SalesService{
	private final SalesDAO salesDao;
	
	@Override
	public List<Map<String, Object>> selectSalesByCategoryView(int salesCategoryNo) {
		return salesDao.selectSalesByCategoryView(salesCategoryNo);
	}

	@Override
	public List<Map<String, Object>> selectSalesAllView() {
		return salesDao.selectSalesAllView();
	}

	@Override
	public List<Map<String, Object>> selectRegdateSalesView() {
		return salesDao.selectRegdateSalesView();
	}

	@Override
	public List<Map<String, Object>> selectSalesRegdate() {
		return salesDao.selectSalesRegdate();
	}

}
