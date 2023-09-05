package com.team2.mbti.main.board.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		List<MbtiVO> mbtiList = null;
		
		if(vo.getBoardFormNo() == 5) {			
			mbtiList = mbtiService.selectAllMbti();
			logger.info("mbti종류 전체조회 결과 mbtiList.size(): {}", mbtiList.size());			
			model.addAttribute("mbtiList", mbtiList);
		}
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("boardFormVo", boardFormVo);
		
		return "main/board/boardList";
	}
	
	@RequestMapping("/boardDetail")
	public String boardDetail(@RequestParam int boardNo, Model model) {
		logger.info("게시판 상세보기 파라미터 baordNo:{}", boardNo);
		
		int cnt = boardService.addReadCount(boardNo);
		logger.info("조회수 증가 결과 cnt: {}", cnt);
		
		Map<String, Object> boardMap = boardService.selectBoardByNo(boardNo);
		logger.info("게시판 상세보기 검색결과 boardMap: {}", boardMap);
				
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
	public String boardWrite(@ModelAttribute BoardVO vo, @RequestParam String boardWriteType, Model model) {
		logger.info("게시판 게시글쓰기 화면 파라미터 vo: {}, boardWriteType: {}", vo, boardWriteType);
		
		List<BoardFormVO> list = boardService.selectAllBoard();
		logger.info("게시판 종류 전체조회 결과: list: {}", list);
		
		BoardFormVO boardFormVo = boardService.selectBoard(vo.getBoardFormNo());
		logger.info("게시판 검색결과 boardFormVo: {}", boardFormVo);
		
		List<MbtiVO> mbtiList = mbtiService.selectAllMbti();
		logger.info("mbti종류 전체조회 결과 mbtiList.size(): {}", mbtiList.size());		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("BOARD_FORM_NO", vo.getBoardFormNo());		
		
		model.addAttribute("boardList", list);	
		model.addAttribute("map", map);
		model.addAttribute("mbtiList", mbtiList);
		model.addAttribute("boardFormVo", boardFormVo);
		
		return "main/board/boardWrite";
	}
	
	@PostMapping("/boardWrite")
	public String boardWrite(@ModelAttribute BoardVO vo, HttpServletRequest request) {
		logger.info("게시글 쓰기처리 파라미터 vo:{}", vo);
		
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
		
		return "redirect:/main/board/boardList?boardFormNo=" + vo.getBoardFormNo();
	}
	
	@GetMapping("/boardEdit")
	public String boardEdit(@ModelAttribute BoardVO vo, Model model) {
		logger.info("게시글 수정 파라미터 vo: {}", vo);
		
		List<BoardFormVO> list = boardService.selectAllBoard();		
		Map<String, Object> map = boardService.selectBoardByNo(vo.getBoardNo());
		List<BoardFileVO> fileList = boardService.selectFileList(vo.getBoardNo());
		
		List<MbtiVO> mbtiList = mbtiService.selectAllMbti();
		logger.info("mbti종류 전체조회 결과 mbtiList.size(): {}", mbtiList.size());	
		
		logger.info("게시글 조회 결과 map: {}", map);
		logger.info("게시판 종류 전체조회 결과: list: {}", list);
		logger.info("게시글 파일 리스트 조회결과 fileList: {}", fileList);
		
		model.addAttribute("map", map);
		model.addAttribute("boardList", list);
		model.addAttribute("fileList", fileList);
		model.addAttribute("mbtiList", mbtiList);
		
		return "main/board/boardWrite";
	}
	
	@ResponseBody
	@GetMapping("/fileDel")
	public boolean fileDel(@RequestParam(defaultValue = "0") int fileNo, @RequestParam String fileName, HttpServletRequest request) {
		logger.info("파일 삭제 파라미터 fileNo: {}, fileName: {}", fileNo, fileName);
		
		boolean result = false;
		if(fileNo != 0) {
			int cnt = boardService.deleteFile(fileNo);
			logger.info("파일 삭제 처리 결과 cnt: {}", cnt);
			
			if(cnt > 0) {
				String filePath = fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_FILE_FLAG);
				File file = new File(filePath, fileName);
				if(file.exists()) {
					result = file.delete();
					logger.info("삭제처리 - 파일삭제처리 결과 result: {}", result);
				}
			}
		}
		
		return result;
	}
	
	@PostMapping("/boardEdit")
	public String boardEdit(@ModelAttribute BoardVO vo, HttpServletRequest request) {
		logger.info("게시글 수정처리 파라미터 vo: {}", vo);
		
		List<Map<String, Object>> fileList = new ArrayList<>();
		
		try {
			fileList = fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_FILE_FLAG);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int cnt = boardService.updateBoard(vo);
		logger.info("게시글 수정처리 결과 cnt: {}", cnt);
		
		int fileCnt = boardService.insertFile(fileList, vo.getBoardNo());
		logger.info("게시판 파일 업로드 처리 결과 fileCnt: {}", fileCnt);
		
		return "redirect:/main/board/boardList?boardFormNo=" + vo.getBoardFormNo();
	}
	
	@GetMapping("/writeReply")
	public String writeReply(@RequestParam int boardNo, @RequestParam int boardFormNo, @RequestParam String boardWriteType, Model model) {
		logger.info("게시글 답변 화면처리 파라미터 boardNo: {}, boardFromNo: {}, boardWriteType: {}", boardNo, boardFormNo, boardWriteType);
		
		List<BoardFormVO> list = boardService.selectAllBoard();		
		Map<String, Object> map = boardService.selectBoardByNo(boardNo);		
		List<MbtiVO> mbtiList = mbtiService.selectAllMbti();
		
		logger.info("게시글 조회 결과 map: {}", map);
		logger.info("게시판 종류 전체조회 결과: list: {}", list);
		logger.info("mbti종류 전체조회 결과 mbtiList.size(): {}", mbtiList.size());	
		
		model.addAttribute("map", map);
		model.addAttribute("boardList", list);			
		model.addAttribute("mbtiList", mbtiList);
		
		return "main/board/boardWrite";
	}
	
	@PostMapping("/writeReply")
	public String boardWriteReply_post(@ModelAttribute BoardVO vo, HttpServletRequest request) {
		logger.info("게시글 답변 처리 파라미터 vo: {}", vo);
		
		List<Map<String, Object>> fileList = new ArrayList<>();
		
		try {
			fileList = fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_FILE_FLAG);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int cnt = boardService.insertBoardReply(vo);
		logger.info("게시글 답변 처리결과 cnt: {}", cnt);
		
		int fileCnt = boardService.insertFile(fileList, vo.getBoardNo());
		logger.info("게시판 파일 업로드 처리 결과 fileCnt: {}", fileCnt);
		
		return "redirect:/main/board/boardList?boardFormNo=" + vo.getBoardFormNo();
	}
	
	@RequestMapping("/boardDel")
	public String boardDel(@ModelAttribute BoardVO vo, HttpServletRequest request, Model model) {
		logger.info("게시글 삭제 파라미터 vo: {}", vo);
		
		Map<String, String> map = new HashMap<>();
		
		map.put("boardNo", vo.getBoardNo() + "");
		map.put("boardStep", vo.getBoardStep() + "");
		map.put("boardGroupNo", vo.getBoardGroupNo() + "");
		
		List<BoardFileVO> list = boardService.selectFileList(vo.getBoardNo());
		logger.info("게시글 첨부파일 조회결과 list: {}", list);
		
		String msg = "게시글을 삭제했습니다.", url = "/main/board/boardList?boardFormNo=" + vo.getBoardFormNo();
		boardService.deleteBoard(map);
		
		for(int i = 0; i < list.size(); i++) {
			BoardFileVO fileVo = list.get(i);
			
			String filePath = fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_FILE_FLAG);
			File file = new File(filePath, fileVo.getFileName());
			
			if(file.exists()) {
				boolean result = file.delete();
				logger.info("파일 삭제처리 결과 result: {}", result);
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}