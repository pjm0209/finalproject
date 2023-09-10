package com.team2.mbti.sales.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SalesVO {
    private int salesNo; /* 매출번호 */
    private int salesCategoryNo; /* 카테고리 */
    private String salesName; /* 이름 */
    private int SALES_PRICE; /* 금액 */
    private Timestamp salesRegdate; /* 판매 날짜 */
    
}
