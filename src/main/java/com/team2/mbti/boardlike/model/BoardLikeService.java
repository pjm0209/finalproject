package com.team2.mbti.boardlike.model;

public interface BoardLikeService {
	int insertLike(BoardLikeVO vo);
	int selectLikeByBoardNo(int boardNo);
	int selectLikeBoard(BoardLikeVO vo);
	int deleteBoardLike(BoardLikeVO vo);
}