package com.team2.mbti.boardlike.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardLikeDAO {
	int insertUserLike(BoardLikeVO vo);
	int insertAdminLike(BoardLikeVO vo);
	int selectLikeByBoardNo(int boardNo);
	int selectLikeBoard(BoardLikeVO vo);
	int deleteBoardLike(BoardLikeVO vo);
}