package com.team2.mbti.order.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderVO extends OrdersDetailVO{
	
	private int no;//NO	NUMBER
	private String recipient;//RECIPIENT	VARCHAR2(30 BYTE)
	private String reZipcode;//RE_ZIPCODE	CHAR(5 BYTE)
	private String reAddress;//RE_ADDRESS	VARCHAR2(100 BYTE)
	private String reAddressDetail;//RE_ADDRESS_DETAIL	VARCHAR2(100 BYTE)
	private String reHp;//RE_HP	VARCHAR2(30 BYTE)
	private int sumPrice;//SUM_PRICE	NUMBER
	private String paymentMethod;//PAYMENT_METHOD	VARCHAR2(20 BYTE)
	private String ordersRegdate1;
	private String ordersRegdate2;
	
	
	private String orderBy;
	private int perRecord;
	
	
	@Override
	public String toString() {
		return "OrderVO [no=" + no + ", recipient=" + recipient + ", reZipcode=" + reZipcode + ", reAddress="
				+ reAddress + ", reAddressDetail=" + reAddressDetail + ", reHp=" + reHp + ", sumPrice=" + sumPrice
				+ ", paymentMethod=" + paymentMethod + ", ordersRegdate1=" + ordersRegdate1 + ", ordersRegdate2="
				+ ordersRegdate2 + ", orderBy=" + orderBy + ", perRecord=" + perRecord + ", toString()="
				+ super.toString() + "]";
	}
	
	
}//
