package com.team2.mbti.board.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.mbti.board.model.BoardFormVO;
import com.team2.mbti.board.model.BoardService;
import com.team2.mbti.board.model.BoardVO;
import com.team2.mbti.common.ConstUtil;
import com.team2.mbti.common.PaginationInfo;
import com.team2.mbti.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/board")
@RequiredArgsConstructor
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	private final BoardService boardService;
	
	@GetMapping("/boardHeadSide")
	public String boardHeadSide(Model model) {
		logger.info("게시판 사이드바");
		
		List<BoardFormVO> list = boardService.selectAllBoard();
		logger.info("게시판 종류 전체조회 결과: list: {}", list);
		
		model.addAttribute("boardList", list);		
		
		return "admin/board/boardHeadSide";
	}
	
	@GetMapping("/board")
	public String board_get(@RequestParam(defaultValue = "1") int boardFormNo, @ModelAttribute BoardVO vo, Model model) {
		logger.info("게시판 관리 화면 보여주기");
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);

		//[2]SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		vo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<Map<String, Object>> list = null;
		
		String board = "";
		
		if(boardFormNo == 1) {
			list = boardService.selectAllNotice(vo);
			
			int totalRecord = boardService.getTotalRecordNotice(vo);
			logger.info("공지사항 목록 전체 조회 - totalRecord: {}", totalRecord);
			pagingInfo.setTotalRecord(totalRecord);
			
			board = "공지사항";
		} else if (boardFormNo == 2) {
			list = boardService.selectAllFaq(vo);
			
			int totalRecord = boardService.getTotalRecordFaq(vo);
			logger.info("FAQ 목록 전체 조회 - totalRecord: {}", totalRecord);
			pagingInfo.setTotalRecord(totalRecord);
			
			board = "FAQ";
		} else if (boardFormNo == 3) {
			
		} else {
			list = boardService.selectAll(vo);
			logger.info("게시판 전체조회 결과: list.size: {}", list.size());
			
			int totalRecord = boardService.getTotalRecord(vo);
			logger.info("글 목록 전체 조회 - totalRecord: {}", totalRecord);
			pagingInfo.setTotalRecord(totalRecord);					
		}		
		
		model.addAttribute("title", "게시판 관리");
		model.addAttribute("boardList", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "admin/board/board";
	}
	
	@GetMapping("/boardCreate")
	public String boardCreate_get(Model model) {
		logger.info("게시판 만들기 화면 보여주기");
		
		model.addAttribute("title", "게시판 만들기");
		
		return "admin/board/boardCreate";
	}		
	
	@PostMapping("/boardCreate")
	public String boardCreate_post(@ModelAttribute BoardFormVO vo, Model model) {
		logger.info("게시판 만들기 처리 파라미터 vo: {}", vo);
		
		int cnt = boardService.insertBoardForm(vo);
		logger.info("게시판 만들기 처리 결과 cnt: {}", cnt);
		
		String msg = "게시판 만들기가 실패하였습니다.", url = "/admin/board/boardCreate";
		if(cnt > 0) {
			msg= "게시판 만들기 성공";
			url = "/admin/board/board";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@GetMapping("/boardEdit")
	public String boardEdit_get(Model model) {
		logger.info("게시판 수정 화면 보여주기");
		
		model.addAttribute("title", "게시판 수정");
		
		return "admin/board/boardEdit";
	}
	
	@GetMapping("/boardWrite")
	public String boardWrite_get(Model model) {
		logger.info("게시판 글쓰기 화면 보여주기");
		
		model.addAttribute("title", "게시판 글쓰기");
		
		return "admin/board/boardWrite";
	}
	
	@PostMapping("/boardWrite")
	public String boardWrite_post(@ModelAttribute BoardVO vo, Model model) {
		logger.info("게시판 글쓰기 처리");
		
		int cnt = boardService.insertBoard(vo);
		logger.info("게시판 글쓰기 처리 결과 cnt: {}", cnt);
		
		String msg = "글 등록 실패!", url = "/admin/board/boardWrite";
		if(cnt > 0) {
			msg = "글쓰기 성공!";
			url = "/admin/board/board";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}