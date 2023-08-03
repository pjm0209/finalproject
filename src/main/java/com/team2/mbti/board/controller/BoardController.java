package com.team2.mbti.board.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@GetMapping("/board")
	public String board_get(@RequestParam(defaultValue = "notice") String boardType, @ModelAttribute SearchVO vo, Model model) {
		logger.info("게시판 관리 화면 보여주기");
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);

		//[2]SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		vo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<Map<String, Object>> list = null;
		
		if(boardType.equals("notice")) {
			list = boardService.selectAllNotice(vo);
			
			int totalRecord = boardService.getTotalRecordNotice(vo);
			logger.info("공지사항 목록 전체 조회 - totalRecord: {}", totalRecord);
			pagingInfo.setTotalRecord(totalRecord);
		} else if (boardType.equals("faq")) {
			list = boardService.selectAllFaq(vo);
			
			int totalRecord = boardService.getTotalRecordFaq(vo);
			logger.info("FAQ 목록 전체 조회 - totalRecord: {}", totalRecord);
			pagingInfo.setTotalRecord(totalRecord);
		} else if (boardType.equals("qna")) {
			
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
}