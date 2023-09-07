package com.team2.mbti.main.basket.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainBasketDAO {
	
	int insertBasket(MainBasketVO vo);
	List<Map<String, Object>> selectBasketBookView(int no);
	int selectCountBasket(MainBasketVO vo);
	int updateBasketQty(MainBasketVO vo);
	
	/*ajax*/
	int editBasketQty(MainBasketVO vo);
	int deleteByBasketNo(int basketNo);
	/*ajax*/
	
	int deleteBasket(int bookNo);
	int deleteCartByNo(int no);
	MainBasketVO selectCartByCartNo(int basketNo);
	
}//
