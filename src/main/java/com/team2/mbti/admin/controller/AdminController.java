package com.team2.mbti.admin.controller;

import java.util.List;

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

import com.team2.mbti.admin.model.AdminService;
import com.team2.mbti.admin.model.AdminVO;
import com.team2.mbti.common.ConstUtil;
import com.team2.mbti.common.PaginationInfo;
import com.team2.mbti.common.SearchVO;
import com.team2.mbti.member.model.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	private static final Logger logger=LoggerFactory.getLogger(AdminController.class);
	
	private final AdminService adminService;
		
	@GetMapping("/index")
	public String index_get(Model model) {
		model.addAttribute("title", "관리자 페이지");
		
		return "admin/index";
	}

	@GetMapping("/register")
	public String register_get(Model model) {
		
		return "admin/register";
	}

	@GetMapping("/tables")
	public String tables_get(Model model) {
		model.addAttribute("title", "회원목록");
		
		return "admin/tables";
	}

	@GetMapping("/cards")
	public String cards_get() {
		return "admin/cards";
	}

	@GetMapping("/charts")
	public String charts_get() {
		return "admin/charts";
	}
	
	@GetMapping("/forgot-password")
	public String forgot_password_get(Model model) {
		model.addAttribute("title", "비밀번호 찾기");
		
		return "admin/forgot-password";
	}
	
	@GetMapping("/buttons")
	public String buttons_get() {
		return "admin/buttons";
	}
	
	@GetMapping("404")
	public String a404_get() {
		return "admin/404";
	}
	
	@GetMapping("blank")
	public String blank_get() {
		return "admin/blank";
	}

	@GetMapping("/utilities-animation")
	public String utilities_animation_get() {
		return "admin/utilities-animation";
	}

	@GetMapping("/utilities-border")
	public String utilities_border_get() {
		return "admin/utilities-border";
	}

	@GetMapping("/utilities-color")
	public String utilities_color_get() {
		return "admin/utilities-color";
	}

	@GetMapping("/utilities-other")
	public String utilities_other_get() {
		return "admin/utilities-other";
	}
	
	@GetMapping("/member/memberDelete")
	public String memberDelet() {
		logger.info("회원 탈퇴 화면");
		return "/admin/member/memberDelete";
	}
	
	@GetMapping("/manager/managerList")
	public String managerList(@ModelAttribute SearchVO vo, @RequestParam(required = false) String searchCondition,
			Model model) {
		logger.info("관리자 리스트 페이지, 파라미터 vo={}, condition={}", vo, searchCondition);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.MBTI_RECORD_COUNT);
		
		vo.setBlockSize(ConstUtil.BLOCK_SIZE);
		vo.setRecordCountPerPage(ConstUtil.MBTI_RECORD_COUNT);
		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<AdminVO> list = adminService.selectAllManager(vo);
		logger.info("관리자 목록 결과 list.size={}", list.size());
		int totalRecord=adminService.getTotalRecordManager(vo);
		logger.info("관리자 전체 검색 결과 totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "admin/manager/managerList";
	}
	
	
	@GetMapping("/manager/managerAdditional")
	public String managerAdditional_get(Model model) {
		
		logger.info("관리자 추가 화면 보여주기");
		
		model.addAttribute("manager", "관리자 추가하기");
		
		return "admin/manager/managerAdditional";
	}	
	
	@ResponseBody
	@RequestMapping("/manager/checkId")
	public int checkId(@RequestParam String adminid, Model model) {
		//1
		logger.info("아이디 중복확인 파라미터, adminid={}", adminid);

		//2
		int result=0;
		result = adminService.checkAdminId(adminid);
		logger.info("중복확인 결과 result={}", result);
		
		//4
		return result;
	}
	
	@PostMapping("/manager/managerAdditional")
	public String managerAdditional_post(@ModelAttribute AdminVO adminvo, Model model){
		logger.info("관리자 등록 처리, 파라미터 membervo={}",adminvo);
		
		int cnt = adminService.insertManager(adminvo);
		
		logger.info("관리자 등록 완료, result = {}",cnt);		
		String msg = "관리자 등록에 실패하였습니다.", url = "/manager/managerAdditional";
		
		if(cnt > 0) {
			msg = "관리자 등록에 성공하였습니다.";
			url = "/admin/manager/managerAdditional";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	
	}
	
	@RequestMapping("/manager/managerDelete")
	public String managerDelete(@ModelAttribute AdminVO adminvo, Model model){
		logger.info("관리자 삭제 처리, 파라미터 membervo={}", adminvo);
		
		int cnt = adminService.deleteAdmin(adminvo.getAdminNo());
		
		String msg="", url="/admin/manager/managerList";
		
		if(cnt > 0) {
			msg="선택한 관리자가 탈퇴되었습니다.";
		}else {
			msg="관리자를 삭제하는중에 에러가 발생하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
}