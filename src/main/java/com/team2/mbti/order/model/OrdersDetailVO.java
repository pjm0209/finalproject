package com.team2.mbti.order.model;

import com.team2.mbti.book.model.BookVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrdersDetailVO extends BookVO{
	private int ordersQty;//ORDERS_QTY	NUMBER
	private String invoiceNumber;//INVOICE_NUMBER	VARCHAR2(50 BYTE)
	private String ordersState;//ORDERS_STATE	VARCHAR2(20 BYTE)
	
	@Override
	public String toString() {
		return "OrdersDetailVO [ordersQty=" + ordersQty + ", invoiceNumber=" + invoiceNumber + ", ordersState="
				+ ordersState + ", toString()=" + super.toString() + "]";
	}
	
	
}
