package com.team2.mbti.board.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team2.mbti.common.SearchVO;

@Mapper
public interface BoardDAO {
	List<Map<String, Object>> selectAll(SearchVO vo);
	List<Map<String, Object>> selectAllNotice(SearchVO vo);
	List<Map<String, Object>> selectAllFaq(SearchVO vo);
	int getTotalRecord(SearchVO vo);
	int getTotalRecordNotice(SearchVO vo);
	int getTotalRecordFaq(SearchVO vo);
}