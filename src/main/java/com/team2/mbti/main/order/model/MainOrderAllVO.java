package com.team2.mbti.main.order.model;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class MainOrderAllVO {
	private MainOrderVO mainOrderVo;
	
	private List<Map<String, Object>> orderDetailList;
}