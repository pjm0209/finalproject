package com.team2.mbti.board.model;

import java.util.ArrayList;
import java.util.HashMap;
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

	@Override
	public List<String> selectBoardFileList(List<BoardVO> listVo) {
		List<String> list = new ArrayList<>();
		
		for(BoardVO vo : listVo) {
			List<BoardFileVO> fileList = boardDao.selectFileList(vo.getBoardNo());
			
			if(fileList != null) {
				for(BoardFileVO fileVo : fileList) {
					list.add(fileVo.getFileName());
				}				
			}
		}
		
		return list;
	}

	@Override
	public void deleteBoardMulti(List<BoardVO> listVo) {
		for(BoardVO vo : listVo) {
			Map<String, String> map = new HashMap<>();
			
			map.put("boardNo", vo.getBoardNo() + "");
			map.put("boardGroupNo", vo.getBoardGroupNo() + "");
			map.put("boardStep", vo.getBoardStep() + "");
			
			boardDao.deleteBoard(map);
		}
	}

	@Override
	public int insertBoardReply(BoardVO vo) {
		return boardDao.insertBoardReply(vo);
	}

	@Override
	public List<Map<String, Object>> selectMainBoardFormCategory() {
		return boardDao.selectMainBoardFormCategory();
	}

	@Override
	public List<Map<String, Object>> selectUserBoardList(int no) {
		return boardDao.selectUserBoardList(no);
	}

	@Override
	public List<Map<String, Object>> selectFaqList() {
		return boardDao.selectFaqList();
	}

	@Override
	public List<Map<String, Object>> selectPrevNextBoard(BoardVO vo) {
		return boardDao.selectPrevNextBoard(vo);
	}
}