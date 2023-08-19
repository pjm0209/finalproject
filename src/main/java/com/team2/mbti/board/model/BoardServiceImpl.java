package com.team2.mbti.board.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.team2.mbti.comment.model.CommentVO;
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
	public int getTotalRecord(SearchVO vo) {
		return boardDao.getTotalRecord(vo);
	}
	
	@Override
	public BoardFormVO selectBoard(int boardFormNo) {
		return boardDao.selectBoard(boardFormNo);
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
	public int adminInsertBoard(BoardVO vo) {		
		return boardDao.insertBoard(vo);
	}

	@Override
	public BoardFormVO selectBoardSet(int boardFormNo) {
		return boardDao.selectBoardSet(boardFormNo);
	}

	@Override
	public int updateBoardSet(BoardFormVO vo) {
		return boardDao.updateBoardSet(vo);
	}

	@Override
	public Map<String, Object> selectBoardByNo(int boardNo) {
		return boardDao.selectBoardByNo(boardNo);
	}

	@Override
	public int addReadCount(int boardNo) {
		return boardDao.addReadCount(boardNo);
	}
	
	@Override
	public int insertFile(List<Map<String, Object>> fileList, int boardNo) {
		int result = 0;
		
		for(Map<String, Object> map : fileList) {
			BoardFileVO vo = new BoardFileVO();
			
			vo.setFileName((String)map.get("fileName"));
			vo.setOriginalFileName((String) map.get("originalFileName"));
			vo.setFileSize((long) map.get("fileSize"));
			vo.setBoardNo(boardNo);
			
			result = boardDao.insertFile(vo);
		}
		
		return result;
	}

	@Override
	public List<BoardFileVO> selectFileList(int boardNo) {
		return boardDao.selectFileList(boardNo);
	}

	@Override
	public int deleteFile(int fileNo) {
		return boardDao.deleteFile(fileNo);
	}

	@Override
	public int updateBoard(BoardVO vo) {
		return boardDao.updateBoard(vo);
	}

	@Override
	public int boardFormDel(int boardFormNo) {
		return boardDao.boardFormDel(boardFormNo);
	}

	@Override
	public int findBoard(int boardFormNo) {
		return boardDao.findBoard(boardFormNo);
	}

	@Override
	public void deleteBoard(Map<String, String> map) {
		boardDao.deleteBoard(map);
	}
}