package com.team2.mbti.main.book.model;

import com.team2.mbti.common.SearchVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MainBookVO extends SearchVO {
	private int bookNo;// BOOK_NO NUMBER
	private String bookTitle;// BOOK_TITLE VARCHAR2(300 BYTE)
	private int bookPrice;// BOOK_PRICE NUMBER
	private String bookPublisher;// BOOK_PUBLISHER VARCHAR2(50 BYTE)
	private String bookRegdate;// BOOK_REGDATE DATE
	private String bookImgName;// BOOK_IMG_NAME VARCHAR2(500 BYTE)
	private long bookImgSize;// BOOK_IMG_SIZE NUMBER
	private String bookImgOriginalname;// BOOK_IMG_ORIGINALNAME VARCHAR2(30 BYTE)
	private String bookCategory;// BOOK_CATEGORY VARCHAR2(50 BYTE)
	private String bookWriter;// BOOK_WRITER VARCHAR2(50 BYTE)
	private String bookUseflag;// BOOK_USEFLAG CHAR(1 BYTE)
	private String bookExplains;// BOOK_EXPLAINS VARCHAR2(200 BYTE)
	private String bookDetails;// BOOK_DETAILS CLOB
	
	private int ordersQty;
	private int ordersNo;
	private int salesNo;
	private int eachBookSum;

	@Override
	public String toString() {
		return "BookVO [bookNo=" + bookNo + ", bookTitle=" + bookTitle + ", bookPrice=" + bookPrice + ", bookPublisher="
				+ bookPublisher + ", bookRegdate=" + bookRegdate + ", bookImgName=" + bookImgName + ", bookImgSize="
				+ bookImgSize + ", bookImgOriginalname=" + bookImgOriginalname + ", bookCategory=" + bookCategory
				+ ", bookWriter=" + bookWriter + ", bookUseflag=" + bookUseflag + ", bookExplains=" + bookExplains
				+ ", bookDetails=" + bookDetails + ", toString()=" + super.toString() + "]";
	}

}//
