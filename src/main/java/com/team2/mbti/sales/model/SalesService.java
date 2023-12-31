package com.team2.mbti.sales.model;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface SalesService {
	List<Map<String, Object>> selectSalesByCategoryView(int salesCategoryNo);
	List<Map<String, Object>> selectSalesAllView();
	List<Map<String, Object>>selectRegdateSalesView();
	
	List<SalesAllVO> selectSalesRegdate(String date);
	List<Map<String, Object>> selectSalesRate();
	
}
