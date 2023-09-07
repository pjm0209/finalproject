package com.team2.mbti.main.order.model;

import lombok.Data;

@Data
public class MainOrderVO {
	private int ordersNo;//ORDERS_NO	NUMBER
	private int no;//NO	NUMBER
	private String recipient;//RECIPIENT	VARCHAR2(30 BYTE)
	private String reZipcode;//RE_ZIPCODE	CHAR(5 BYTE)
	private String reAddress;//RE_ADDRESS	VARCHAR2(100 BYTE)
	private String reAddressDetail;//RE_ADDRESS_DETAIL	VARCHAR2(100 BYTE)
	private String reHp;//RE_HP	VARCHAR2(30 BYTE)
	private int sumPrice;//SUM_PRICE	NUMBER
	private String paymentMethod;//PAYMENT_METHOD	VARCHAR2(20 BYTE)
	private String ordersRegdate;//ORDERS_REGDATE	DATE
}
