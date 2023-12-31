package com.team2.mbti.board.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team2.mbti.comment.model.CommentVO;
import com.team2.mbti.common.SearchVO;

@Mapper
public interface BoardDAO {
	List<Map<String, Object>> selectAll(SearchVO vo);
	int getTotalRecord(SearchVO vo);

	BoardFormVO selectBoard(int boardFormNo);
	
	List<BoardFormVO> selectAllBoard();
	
	int insertBoardForm(BoardFormVO vo);
	int findBoard(int boardFormNo);
	int boardFormDel(int boardFormNo);
	
	int insertBoard(BoardVO vo);	
	int updateBoard(BoardVO vo);
	void deleteBoard(Map<String, String> map);
	
	BoardFormVO selectBoardSet(int boardFormNo);
	int updateBoardSet(BoardFormVO vo);
	
	Map<String, Object> selectBoardByNo(int boardNo);
	int addReadCount(int boardNo);
	
	int insertFile(BoardFileVO fileVo);
	
	List<BoardFileVO> selectFileList(int boardNo);
	
	int deleteFile(int fileNo);
	
	int insertBoardReply(BoardVO vo);
	
	List<Map<String, Object>> selectMainBoardFormCategory();
	
	List<Map<String , Object>> selectUserBoardList(int no);
	
	List<Map<String, Object>> selectFaqList();
	
	List<Map<String, Object>> selectPrevNextBoard(BoardVO vo);
}