package com.team2.mbti.board.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team2.mbti.common.SearchVO;

@Mapper
public interface BoardDAO {
	List<Map<String, Object>> selectAll(SearchVO vo);
	int getTotalRecord(SearchVO vo);

	String selectBoardName(int boardFormNo);
	
	List<BoardFormVO> selectAllBoard();
	
	int insertBoardForm(BoardFormVO vo);
	int adminInsertBoard(BoardVO vo);
	int insertBoard(BoardVO vo);
	
	BoardFormVO selectBoardSet(int boardFormNo);
	int updateBoardSet(BoardFormVO vo);
	
	Map<String, Object> selectBoardByNo(int boardNo);
	int addReadCount(int boardNo);
	
	List<CommentsVO> selectComment(int boardNo);
	
	int insertFile(BoardFileVO fileVo);
	
	List<BoardFileVO> selectFileList(int boardNo);
}