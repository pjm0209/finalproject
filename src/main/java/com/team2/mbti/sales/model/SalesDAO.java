package com.team2.mbti.sales.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SalesDAO {
	List<Map<String, Object>> selectSalesByCategoryView(int salesCategoryNo);
	List<Map<String, Object>> selectSalesAllView();
	List<Map<String, Object>> selectRegdateSalesView();
	
	List<Map<String, Object>> selectSalesRegdate();
}
