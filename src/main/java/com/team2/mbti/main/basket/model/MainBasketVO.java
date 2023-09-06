package com.team2.mbti.main.basket.model;

import com.team2.mbti.common.SearchVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MainBasketVO extends SearchVO {

	private int basketNo;//BASKET_NO	NUMBER
	private int bookNo;//BOOK_NO	NUMBER
	private int no;//NO	NUMBER
	private int basketQty;//BASKET_QTY	NUMBER
	
	
	@Override
	public String toString() {
		return "MainBasketVO [basketNo=" + basketNo + ", bookNo=" + bookNo
				+ ", no=" + no + ", basketQty=" + basketQty
				+ ", toString()=" + super.toString() + "]";
	}
	
}//
