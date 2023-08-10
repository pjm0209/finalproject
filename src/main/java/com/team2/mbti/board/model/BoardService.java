package com.team2.mbti.board.model;

import java.util.List;
import java.util.Map;

import com.team2.mbti.common.SearchVO;

public interface BoardService {
	List<Map<String, Object>> selectAll(SearchVO vo);
	int getTotalRecord(SearchVO vo);
	
	String selectBoardName(int boardFormNo);
	
	List<BoardFormVO> selectAllBoard();
	
	int insertBoardForm(BoardFormVO vo);
	int insertBoard(BoardVO vo);
	
	BoardFormVO selectBoardSet(int boardFormNo);
	int updateBoardSet(BoardFormVO vo);
	
	Map<String, Object> selectBoardByNo(int boardNo);
	int addReadCount(int boardNo);
	
	List<CommentsVO> selectComment(int boardNo);
}