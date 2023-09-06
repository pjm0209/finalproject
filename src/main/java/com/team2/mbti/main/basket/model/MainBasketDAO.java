package com.team2.mbti.main.basket.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainBasketDAO {
	
	int insertBasket(MainBasketVO vo);
	List<Map<String, Object>> selectBasketBookView(int memberNo);
	int selectCountBasket(MainBasketVO vo);
	int updateBasketQty(MainBasketVO vo);
	int editBasketQty(MainBasketVO vo);
	int deleteBasket(int bookNo);
	int deleteCartByNo(int memberNo);
	MainBasketVO selectCartByCartNo(int basketNo);
}//
