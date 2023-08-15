package com.team2.mbti.board.model;

import java.util.List;
import java.util.Map;

import com.team2.mbti.comment.model.CommentVO;
import com.team2.mbti.common.SearchVO;

public interface BoardService {
	List<Map<String, Object>> selectAll(SearchVO vo);
	int getTotalRecord(SearchVO vo);
	
	BoardFormVO selectBoard(int boardFormNo);
	
	List<BoardFormVO> selectAllBoard();
	
	int insertBoardForm(BoardFormVO vo);
	int adminInsertBoard(BoardVO vo);
	
	BoardFormVO selectBoardSet(int boardFormNo);
	int updateBoardSet(BoardFormVO vo);
	
	Map<String, Object> selectBoardByNo(int boardNo);
	int addReadCount(int boardNo);
	
	int insertFile(List<Map<String, Object>> list, int boardNo);
	
	List<BoardFileVO> selectFileList(int boardNo);
	
	int deleteFile(int fileNo);
	
	int updateBoard(BoardVO vo);
}