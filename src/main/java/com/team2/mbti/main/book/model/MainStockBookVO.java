package com.team2.mbti.main.book.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MainStockBookVO extends MainBookVO {
	private int stockQty;
	private String orderBy;
	private String bookFlag;
	private int perRecord;
	private String keywordCategory;
	private String keywordNo;
	private String keywordTitle;
	private String keywordPublisher;
	private String keywordUseflag;
	private String keywordRegdate;
	private String keywordRegdate2;

	@Override
	public String toString() {
		return "StockBookVO [stockQty=" + stockQty + ", orderBy=" + orderBy + ", bookFlag=" + bookFlag + ", perRecord="
				+ perRecord + ", keywordCategory=" + keywordCategory + ", keywordNo=" + keywordNo + ", keywordTitle="
				+ keywordTitle + ", keywordPublisher=" + keywordPublisher + ", keywordUseflag=" + keywordUseflag
				+ ", keywordRegdate=" + keywordRegdate + ", keywordRegdate2=" + keywordRegdate2 + ", toString()="
				+ super.toString() + "]";
	}

}//
