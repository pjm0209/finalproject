package com.team2.mbti.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;

import com.team2.mbti.board.model.BoardFileVO;
import com.team2.mbti.board.model.BoardFormVO;
import com.team2.mbti.board.model.BoardService;
import com.team2.mbti.board.model.BoardVO;
import com.team2.mbti.board.model.CommentsVO;
import com.team2.mbti.common.ConstUtil;
import com.team2.mbti.common.FileUploadUtil;
import com.team2.mbti.common.PaginationInfo;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/board")
@RequiredArgsConstructor
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	private final BoardService boardService;
	private final FileUploadUtil fileUploadUtil;
	
	@GetMapping("/boardHeadSide")
	public String boardHeadSide(Model model) {
		logger.info("게시판 사이드바");
		
		List<BoardFormVO> list = boardService.selectAllBoard();
		logger.info("게시판 종류 전체조회 결과: list: {}", list);
		
		model.addAttribute("boardList", list);		
		
		return "admin/board/boardHeadSide";
	}
	
	@RequestMapping("/board")
	public String board_get(@RequestParam int boardFormNo, @ModelAttribute BoardVO vo, Model model) {
		logger.info("게시판 관리 화면 보여주기 파라미터 boardFormNo: {}, vo: {}", boardFormNo, vo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);

		//[2]SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		vo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		List<Map<String, Object>> list = null;
		
		BoardFormVO boardFormVo = boardService.selectBoard(boardFormNo);
		logger.info("게시판 이름 검색결과 board: {}", boardFormVo);
		
		List<BoardFormVO> boardList = boardService.selectAllBoard();
		logger.info("게시판 종류 전체조회 결과: boardList: {}", boardList);
		
		list = boardService.selectAll(vo);
		logger.info("게시판 전체조회 결과: list.size: {}", list.size());
		
		int totalRecord = boardService.getTotalRecord(vo);
		logger.info("글 목록 전체 조회 - totalRecord: {}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);						
		
		model.addAttribute("title", "게시판 관리");
		model.addAttribute("list", list);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("boardFormVo", boardFormVo);
		
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
			url = "/admin/board/board?boardFormNo=" + vo.getBoardFormNo();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@GetMapping("/boardEdit")
	public String boardEdit_get(@RequestParam int boardFormNo, Model model) {
		logger.info("게시판 수정 화면 보여주기 파라미터 boardFormNo: {}", boardFormNo);
		
		BoardFormVO vo = boardService.selectBoardSet(boardFormNo);
		logger.info("게시판 설정 불러오기 결과 vo: {}", vo);
				
		model.addAttribute("title", "게시판 수정");
		model.addAttribute("vo", vo);
		
		return "admin/board/boardEdit";
	}
	
	@PostMapping("/boardEdit")
	public String boardEdit_post(@ModelAttribute BoardFormVO vo, Model model) {
		logger.info("게시판 수정 처리 파라미터 vo: {}", vo);
		
		int cnt = boardService.updateBoardSet(vo);
		logger.info("게시판 수정 처리 결과 cnt: {}", cnt);
		
		String msg = "게시판 수정 실패!", url = "/admin/board/boardEdit?boardFormNo=" + vo.getBoardFormNo();
		if(cnt > 0) {
			msg = "게시판 수정 성공!";
			url = "/admin/board/board?boardFormNo=" + vo.getBoardFormNo();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@GetMapping("/boardWrite")
	public String boardWrite_get(@RequestParam int boardFormNo, Model model) {
		logger.info("게시판 글쓰기 화면 보여주기");
		
		List<BoardFormVO> list = boardService.selectAllBoard();
		logger.info("게시판 종류 전체조회 결과: list: {}", list);
		
		BoardFormVO boardFormVo = boardService.selectBoard(boardFormNo);
		logger.info("게시판 검색결과 boardFormVo: {}", boardFormVo);
		
		model.addAttribute("boardList", list);			
		model.addAttribute("title", "게시판 글쓰기");
		model.addAttribute("boardFormVo", boardFormVo);
		
		return "admin/board/boardWrite";
	}
	
	@PostMapping("/boardWrite")
	public String boardWrite_post(@ModelAttribute BoardVO vo, HttpServletRequest request) {
		logger.info("게시판 글쓰기 처리 파라미터 vo: {}", vo);
		
		List<Map<String, Object>> fileList = new ArrayList<>();
		
		try {
			fileList = fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_FILE_FLAG);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int cnt = boardService.adminInsertBoard(vo);
		logger.info("게시판 글쓰기 처리 결과 cnt: {}", cnt);
		
		int fileCnt = boardService.insertFile(fileList, vo.getBoardNo());
		logger.info("게시판 파일 업로드 처리 결과 fileCnt: {}", fileCnt);
		
		return "redirect:/admin/board/board?boardFormNo=" + vo.getBoardFormNo();
	}
	
	@GetMapping("/boardWriteEdit")
	public String boardWriteEdit_get(@RequestParam int boardNo, Model model) {
		logger.info("게시글 수정 화면 파라미터 boardNo: {}", boardNo);
		
		List<BoardFormVO> list = boardService.selectAllBoard();		
		Map<String, Object> map = boardService.selectBoardByNo(boardNo);
		List<BoardFileVO> fileList = boardService.selectFileList(boardNo);
		
		logger.info("게시글 조회 결과 map: {}", map);
		logger.info("게시판 종류 전체조회 결과: list: {}", list);
		logger.info("게시글 파일 리스트 조회결과 fileList: {}", fileList);
		
		model.addAttribute("title", "게시글 수정");
		model.addAttribute("map", map);
		model.addAttribute("boardList", list);
		model.addAttribute("fileList", fileList);
		
		return "admin/board/boardWrite";
	}
	
	@GetMapping("/boardDetail")
	public String boardDetail_get(@RequestParam int boardNo, Model model) {
		logger.info("게시글 상세보기 화면처리 파라미터 boardFormNo: {}", boardNo);
		
		Map<String, Object> map = boardService.selectBoardByNo(boardNo);
		int cnt = boardService.addReadCount(boardNo);
		
		List<CommentsVO> commentList = null;
		List<BoardFileVO> fileList = null;
		
		logger.info("게시글 조회 결과 map: {}", map);
		logger.info("조회수 증가 결과 cnt: {}", cnt);
		
		if(map.get("COMMENT_FLAG").equals("Y")) {
			commentList = boardService.selectComment(boardNo);
			logger.info("게시글 댓글 조회 결과 commentList.size: {}", commentList);
		}
		
		if(map.get("BOARD_FILE_ADD_FLAG").equals("Y")) {
			fileList = boardService.selectFileList(boardNo);
			logger.info("게시글 파일 리스트 조회결과 fileList: {}", fileList);
		}				
		
		model.addAttribute("title", "게시글 상세보기");
		model.addAttribute("map", map);
		model.addAttribute("commentList", commentList);
		model.addAttribute("fileList", fileList);
		
		return "admin/board/boardDetail";
	}
	
	@GetMapping("/fileDown")
	public ModelAndView fileDown(@RequestParam String fileName, HttpServletRequest request) {
		logger.info("파일 다운로드처리 파라미터 fileName: {}", fileName);
		
		Map<String, Object> map = new HashMap<>();
		String upPath = fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_FILE_FLAG);
		File file = new File(upPath, fileName);
		map.put("file", file);
		
		ModelAndView mav = new ModelAndView("fileDownload", map);
		
		return mav;
	}
}