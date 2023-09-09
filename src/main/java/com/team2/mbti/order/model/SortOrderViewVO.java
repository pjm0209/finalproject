package com.team2.mbti.order.model;

import com.team2.mbti.common.SearchVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SortOrderViewVO extends SearchVO{
	private int ordersNo;//ORDERS_NO	NUMBER
	private int no;	//NO	NUMBER
	private String name; //NAME	VARCHAR2(30)
	private String userid;//userid
	private String recipient;//RECIPIENT	VARCHAR2(30)
	private int sumPrice;//SUM_PRICE	NUMBER
	private String paymentMethod;//PAYMENT_METHOD	VARCHAR2(20)
	private String ordersRegdate;//ORDERS_REGDATE	DATE
	private String books;//BOOKS	VARCHAR2(4000)
	private String bookTitle;//BOOKTITLE	VARCHAR2(4000)
	private String ordersState;//ORDERS_STATE	VARCHAR2(20)
	
	private String keywordPM;
	private String keywordOrdersState;
	private String keywordOrdersNo;
	private String keywordName;
	private String keywordUserID;
	private String keywordRegdate;
	private String keywordRegdate2;
	private String orderBy;
	private int perRecord;
	
	
	@Override
	public String toString() {
		return "SortOrderViewVO [ordersNo=" + ordersNo + ", no=" + no + ", name=" + name + ", userid=" + userid
				+ ", recipient=" + recipient + ", sumPrice=" + sumPrice + ", paymentMethod=" + paymentMethod
				+ ", ordersRegdate=" + ordersRegdate + ", books=" + books + ", bookTitle=" + bookTitle
				+ ", ordersState=" + ordersState + ", keywordPM=" + keywordPM + ", keywordOrdersState="
				+ keywordOrdersState + ", keywordOrdersNo=" + keywordOrdersNo + ", keywordName=" + keywordName
				+ ", keywordUserID=" + keywordUserID + ", keywordRegdate=" + keywordRegdate + ", keywordRegdate2="
				+ keywordRegdate2 + ", orderBy=" + orderBy + ", perRecord=" + perRecord + ", toString()="
				+ super.toString() + "]";
	}
	
}//
