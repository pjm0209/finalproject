package com.team2.mbti.main.order.model;

import lombok.Data;

@Data
public class MainOrdersDetailVO {
	private int ordersNo;//ORDERS_NO	NUMBER
	private int bookNo;//BOOK_NO	NUMBER
	private int ordersQty;//ORDERS_QTY	NUMBER
	private String invoiceNumber;//INVOICE_NUMBER	VARCHAR2(50 BYTE)
	private String ordersState;//ORDERS_STATE	VARCHAR2(20 BYTE)
}
