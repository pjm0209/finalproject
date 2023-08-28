package com.team2.mbti.book.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class orderBookVO extends BookVO{
	private String orderBy;
	private int ordersNo; // ORDERS_NO	NUMBER
	private int ordersQty; // ORDERS_QTY	NUMBER
	private String invoiceNumber;// INVOICE_NUMBER	VARCHAR2(50)
	private String ordersState;// ORDERS_STATE	VARCHAR2(20)
	
	@Override
	public String toString() {
		return "orderBookVO [orderBy=" + orderBy + ", ordersNo=" + ordersNo + ", ordersQty=" + ordersQty
				+ ", invoiceNumber=" + invoiceNumber + ", ordersState=" + ordersState + ", toString()="
				+ super.toString() + "]";
	}
	
	
}//
