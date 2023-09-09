package com.team2.mbti.sales.model;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class SalesAllVO {
	private String regdate;
	private List<Map<String, Object>> salesList;
}
