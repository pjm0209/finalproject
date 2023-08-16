package com.team2.mbti.boardlike.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardLikeServiceImpl implements BoardLikeService {
	private final BoardLikeDAO boardLikeDao;

	@Override
	public int insertLike(BoardLikeVO vo) {
		int cnt = 0;
		
		if(vo.getAdminNo() != 0) {
			cnt = boardLikeDao.insertAdminLike(vo);
		} else {
			cnt = boardLikeDao.insertUserLike(vo);
		}
		
		return cnt;
	}

	@Override
	public int selectLikeByBoardNo(int boardNo) {
		int result = 0;
		
		result = boardLikeDao.selectLikeByBoardNo(boardNo);
		
		return result;
	}

	@Override
	public int selectLikeBoard(BoardLikeVO vo) {
		int cnt = 0;
		
		cnt = boardLikeDao.selectLikeBoard(vo);
		
		return cnt;
	}

	@Override
	public int deleteBoardLike(BoardLikeVO vo) {
		int cnt = 0;
		
		cnt = boardLikeDao.deleteBoardLike(vo);
		
		return cnt;
	}
}