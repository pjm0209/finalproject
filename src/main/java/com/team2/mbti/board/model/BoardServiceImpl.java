package com.team2.mbti.board.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.team2.mbti.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
	private final BoardDAO boardDao;

	@Override
	public List<Map<String, Object>> selectAll(SearchVO vo) {
		return boardDao.selectAll(vo);
	}
	
	@Override
	public List<Map<String, Object>> selectAllNotice(SearchVO vo) {
		return boardDao.selectAllNotice(vo);
	}
	
	@Override
	public List<Map<String, Object>> selectAllFaq(SearchVO vo) {
		return boardDao.selectAllFaq(vo);
	}

	@Override
	public int getTotalRecord(SearchVO vo) {
		return boardDao.getTotalRecord(vo);
	}

	@Override
	public int getTotalRecordNotice(SearchVO vo) {
		return boardDao.getTotalRecordNotice(vo);
	}

	@Override
	public int getTotalRecordFaq(SearchVO vo) {
		return boardDao.getTotalRecordFaq(vo);
	}

	@Override
	public List<BoardFormVO> selectAllBoard() {
		return boardDao.selectAllBoard();
	}

	@Override
	public int insertBoardForm(BoardFormVO vo) {
		return boardDao.insertBoardForm(vo);
	}

	@Override
	public int insertBoard(BoardVO vo) {
		return boardDao.insertBoard(vo);
	}
}