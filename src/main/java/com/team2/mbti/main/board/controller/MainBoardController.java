package com.team2.mbti.main.board.controller;

import java.io.File;
import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;

import com.team2.mbti.board.model.BoardFileVO;
import com.team2.mbti.board.model.BoardFormVO;
import com.team2.mbti.board.model.BoardService;
import com.team2.mbti.board.model.BoardVO;
import com.team2.mbti.common.ConstUtil;
import com.team2.mbti.common.FileUploadUtil;
import com.team2.mbti.common.PaginationInfo;
import com.team2.mbti.mbtisurvey.model.MbtiSurveyService;
import com.team2.mbti.mbtisurvey.model.MbtiVO;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main/board")
public class MainBoardController {
	private static final Logger logger = LoggerFactory.getLogger(MainBoardController.class);
	
	private final BoardService boardService;
	private final MbtiSurveyService mbtiService;
	private final FileUploadUtil fileUploadUtil;
	
	@RequestMapping("/boardFormList")
	public String boardFormList(Model model) {
		logger.info("게시판 종류 조회");
		
		List<BoardFormVO> boardFormList = boardService.selectAllBoard();
		logger.info("게시판 종류 조회결과 boardFormList: {}", boardFormList);
		
		model.addAttribute("boardFormList", boardFormList);
		
		return "main/board/boardFormList";
	}
	
	@RequestMapping("/boardMain")
	public String boardMain(Model model) {
		logger.info("커뮤니티 메인페이지");
		
		List<Map<String, Object>> boardCategoryList = boardService.selectMainBoardFormCategory();
		logger.info("게시판목록 조회결과 boardCategoryList: {}", boardCategoryList);
		
		model.addAttribute("boardCategoryList", boardCategoryList);
		
		return "main/board/boardMain";
	}
	
	@RequestMapping("/boardList")
	public String boardList(@ModelAttribute BoardVO vo, Model model) {
		logger.info("게시판 리스트 파라미터 vo: {}", vo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.BOARD_RECORD_COUNT);

		vo.setRecordCountPerPage(ConstUtil.BOARD_RECORD_COUNT);
		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> boardList = boardService.selectAll(vo);
		logger.info("게시판 리스트 조회결과 boardList: {}", boardList);
		
		BoardFormVO boardFormVo = boardService.selectBoard(vo.getBoardFormNo());
		logger.info("게시판 검색결과 board: {}", boardFormVo);
		
		int totalRecord = boardService.getTotalRecord(vo);
		logger.info("글 목록 전체 조회 - totalRecord: {}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);	
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("boardFormVo", boardFormVo);
		
		return "main/board/boardList";
	}
	
	@RequestMapping("/boardDetail")
	public String boardDetail(@RequestParam int boardNo, Model model) {
		logger.info("게시판 상세보기 파라미터 baordNo:{}", boardNo);
		
		Map<String, Object> boardMap = boardService.selectBoardByNo(boardNo);
		logger.info("게시판 상세보기 검색결과 boardMap: {}", boardMap);
		
		int cnt = boardService.addReadCount(boardNo);
		logger.info("조회수 증가 결과 cnt: {}", cnt);
		
		List<BoardFileVO> fileList = null;
		
		if(boardMap.get("BOARD_FILE_ADD_FLAG").equals("Y")) {
			fileList = boardService.selectFileList(boardNo);
			logger.info("게시글 파일 리스트 조회결과 fileList: {}", fileList);
		}
		
		model.addAttribute("boardMap", boardMap);
		model.addAttribute("fileList", fileList);
				
		return "main/board/boardDetail";
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
	
	@GetMapping("/boardWrite")
	public String boardWrite(@RequestParam(required = false) int boardFormNo, Model model) {
		logger.info("게시판 게시글쓰기 파라미터 boardFormNo: {}", boardFormNo);
		
		List<BoardFormVO> list = boardService.selectAllBoard();
		logger.info("게시판 종류 전체조회 결과: list: {}", list);
		
		List<MbtiVO> mbtiList = null;
		
		if(boardFormNo == 5) {			
			mbtiList = mbtiService.selectAllMbti();
			logger.info("mbti종류 전체조회 결과 mbtiList: {}", mbtiList);			
		}
		
		model.addAttribute("boardList", list);	
		model.addAttribute("mbtiList", mbtiList);
		
		return "main/board/boardWrite";
	}
}