package com.team2.mbti.main.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.mbti.board.model.BoardService;
import com.team2.mbti.common.ConstUtil;
import com.team2.mbti.main.order.model.MainOrderService;
import com.team2.mbti.main.order.model.MainOrdersDetailVO;
import com.team2.mbti.mbtiResult.model.MbtiResultService;
import com.team2.mbti.mbtiResult.model.MbtiResultVO;
import com.team2.mbti.mbtisurvey.model.MbtiSurveyService;
import com.team2.mbti.mbtisurvey.model.MbtiVO;
import com.team2.mbti.member.model.MemberService;
import com.team2.mbti.member.model.MemberVO;
import com.team2.mbti.order.model.OrdersService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main/mypage")
@RequiredArgsConstructor
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	private final MbtiSurveyService mbtiSurveyService;
	private final MbtiResultService mbtiResultService;
	private final MemberService memberService;
	private final BoardService boardService;	
	private final MainOrderService orderService;
	private final OrdersService odService;
	
	private final PasswordEncoder passwordEncoder;
	
	@RequestMapping("/mypage")
	public String mypage() {
		logger.info("마이페이지");
		
		return "main/mypage/mypage";
	}
	
	@RequestMapping("/mbtiResult")
	public String mbtiResult(HttpSession session, Model model) {
		int no=(int)session.getAttribute("no");
		logger.info("마이페이지 - 나의 mbti 결과 페이지, 파리미터 no={}",no);
		
		double questionCategory1Val=0.0;
		double questionCategory2Val=0.0;
		double questionCategory3Val=0.0;
		double questionCategory4Val=0.0;
		double questionCategory5Val=0.0;
		double questionCategory6Val=0.0;
		double questionCategory7Val=0.0;
		double questionCategory8Val=0.0;
		double iVal=0;
		double eVal=0;
		double sVal=0;
		double nVal=0;
		double tVal=0;
		double fVal=0;
		double pVal=0;
		double jVal=0;
		int count=0;
		List<MbtiResultVO> resultList=mbtiResultService.getResultVal(no);
		logger.info("mbti 검사 합산 결과, resultList.size()={}",resultList.size());
		
		for(int i=0;i<resultList.size();i++) {
			MbtiResultVO mbtiResultVo=resultList.get(i);
			
			if(mbtiResultVo.getQuestionCategoryNo()==1) {
				questionCategory1Val=mbtiResultVo.getMbtiVal();
				count=mbtiSurveyService.getTotalRecordMbtiByQuestionTypeNo(mbtiResultVo);
				iVal= questionCategory1Val/count;
				logger.info("1count={},iVal={}",count,iVal);
			}
			
			if(mbtiResultVo.getQuestionCategoryNo()==2) {
				questionCategory2Val=mbtiResultVo.getMbtiVal();
				count=mbtiSurveyService.getTotalRecordMbtiByQuestionTypeNo(mbtiResultVo);
				eVal=questionCategory2Val/count;
				logger.info("2count={},eVal={}",count,eVal);
			}
			
			if(mbtiResultVo.getQuestionCategoryNo()==3) {
				questionCategory3Val=mbtiResultVo.getMbtiVal();
				count=mbtiSurveyService.getTotalRecordMbtiByQuestionTypeNo(mbtiResultVo);
				sVal=questionCategory3Val/count;
			}
			
			if(mbtiResultVo.getQuestionCategoryNo()==4) {
				questionCategory4Val=mbtiResultVo.getMbtiVal();
				count=mbtiSurveyService.getTotalRecordMbtiByQuestionTypeNo(mbtiResultVo);
				nVal=questionCategory4Val/count;
			}
			
			if(mbtiResultVo.getQuestionCategoryNo()==5) {
				questionCategory5Val=mbtiResultVo.getMbtiVal();
				count=mbtiSurveyService.getTotalRecordMbtiByQuestionTypeNo(mbtiResultVo);
				tVal=questionCategory5Val/count;
			}
			
			if(mbtiResultVo.getQuestionCategoryNo()==6) {
				questionCategory6Val=mbtiResultVo.getMbtiVal();
				count=mbtiSurveyService.getTotalRecordMbtiByQuestionTypeNo(mbtiResultVo);
				fVal=questionCategory6Val/count;
			}
			
			if(mbtiResultVo.getQuestionCategoryNo()==7) {
				questionCategory7Val=mbtiResultVo.getMbtiVal();
				count=mbtiSurveyService.getTotalRecordMbtiByQuestionTypeNo(mbtiResultVo);
				pVal=questionCategory7Val/count;
			}
			
			if(mbtiResultVo.getQuestionCategoryNo()==8) {
				questionCategory8Val=mbtiResultVo.getMbtiVal();
				count=mbtiSurveyService.getTotalRecordMbtiByQuestionTypeNo(mbtiResultVo);
				jVal=questionCategory8Val/count;
			}
		}
		
		double resultI=0;
		double resultE=0;
		double resultS=0;
		double resultN=0;
		double resultT=0;
		double resultF=0;
		double resultP=0;
		double resultJ=0;

		String resultMbti="";
		if(iVal>eVal) {
			resultMbti+="I";
			resultI=Math.round(iVal/(iVal+eVal)*100*10)/10.0;
			resultE=Math.round((100-resultI)*10)/10.0;
		}else {
			resultMbti+="E";
			resultE=Math.round(eVal/(iVal+eVal)*100*10)/10.0;
			resultI=Math.round((100-resultE)*10)/10.0;
		}
		
		if(sVal>nVal) {
			resultMbti+="S";
			resultS=Math.round(sVal/(sVal+nVal)*100*10)/10.0;
			resultN=Math.round((100-resultS)*10)/10.0;
		}else {
			resultMbti+="N";
			resultN=Math.round(nVal/(sVal+nVal)*100*10)/10.0;
			resultS=Math.round((100-resultN)*10)/10.0;
		}
		
		if(tVal>fVal) {
			resultMbti+="T";
			resultT=Math.round(tVal/(tVal+fVal)*100*10)/10.0;
			resultF=Math.round((100-resultT)*10)/10.0;
		}else {
			resultMbti+="F";
			resultF=Math.round(fVal/(tVal+fVal)*100*10)/10.0;
			resultT=Math.round((100-resultF)*10)/10.0;
		}
		
		if(pVal>jVal) {
			resultMbti+="P";
			resultP=Math.round(pVal/(pVal+jVal)*100*10)/10.0;
			resultJ=Math.round((100-resultP)*10)/10.0;
		}else {
			resultMbti+="J";
			resultJ=Math.round(jVal/(pVal+jVal)*100*10)/10.0;
			resultP=Math.round((100-resultJ)*10)/10.0;
		}
		
		MbtiVO mbtiVo=mbtiSurveyService.selectMbti(resultMbti);
		logger.info("MBTI 검사한 결과 조회, mbtiVo={}",mbtiVo);
		
		MemberVO memberVo= new MemberVO();
		memberVo.setNo(no);
		memberVo.setMbtiNo(mbtiVo.getMbtiNo());
		
		int cnt2=mbtiSurveyService.updateMemberMbtiNoByNo(memberVo);
		logger.info("MBTI 결과 회원정보 입력(수정) 결과 cnt2={}",cnt2);
		
		model.addAttribute("resultMbti", resultMbti);
		model.addAttribute("resultI", resultI);
		model.addAttribute("resultE", resultE);
		model.addAttribute("resultS", resultS);
		model.addAttribute("resultN", resultN);
		model.addAttribute("resultT", resultT);
		model.addAttribute("resultF", resultF);
		model.addAttribute("resultP", resultP);
		model.addAttribute("resultJ", resultJ);
		model.addAttribute("mbtiVo", mbtiVo);
		
		return "main/mypage/mbtiResult";
	}
	
	@GetMapping("/memberEditPwd")
	public String memberEditPwd() {
		logger.info("개인정보 수정 비밀번호 입력 화면");

		return "main/mypage/memberEditPwd";
	}
	
	@PostMapping("/memberEditPwd")
	public String memberEditPwd_post(@ModelAttribute MemberVO membervo, HttpSession session, 
			@RequestParam String currentPassword, Model model) {
		logger.info("개인정보 수정 비밀번호 처리하기!!");
		
		String userid=(String)session.getAttribute("userid");
		logger.info("파라미터, userid={}, currentPassword={}, userid, currentPassword");
		
		String msg="실패!!", url="/mypage/memberEditPwd";
		String str = memberService.pwdCheck(userid);
		logger.info("비밀 번호 확인 처리 str={}", str);
		
		if(passwordEncoder.matches(currentPassword, str)) {		
			logger.info("결과 if : {}", passwordEncoder.matches(currentPassword, str));
			return "redirect:/main/mypage/memberEdit";
			
		}else{
			logger.info("결과 else : {}", passwordEncoder.matches(currentPassword, str));
			msg="비밀번호가 틀렸습니다.";
			url="/main/mypage/memberEditPwd";
		}
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
		return "common/message";
		//return "redirect:/main/mypage/memberEditPwd"; 
	}
			
	@GetMapping("/memberEdit")
	public String memberEdit_get(HttpSession session, Model model) {
		
		String userid=(String) session.getAttribute("userid");
		
		logger.info("개인 정보 수정 화면, 파라미터 userid={}", userid);
		
		MemberVO membervo = memberService.selectByUserid(userid);
		logger.info("개인 정보 수정 정보 조회 결과 membervo={}", membervo);
				
		model.addAttribute("membervo",membervo);
		
		return "main/mypage/memberEdit";
	}
	
	@PostMapping("/memberEdit")
	public String memberEdit_post(@ModelAttribute MemberVO membervo, HttpSession session, Model model) {
		
		String userid = (String)session.getAttribute("userid");
		membervo.setUserid(userid);

		logger.info("회원 수정 처리, 파라미터 membervo={}", membervo);
			
		//이메일 처리
		if(membervo.getEmail()==null || membervo.getEmail().isEmpty()) {
			membervo.setEmail("");
		}
		
		//전화번호 처리
		if(membervo.getHp()==null || membervo.getHp().isEmpty()){
			membervo.setHp("");
		}
		
		//주소 처리
		if(membervo.getAddress()==null || membervo.getAddress().isEmpty() || membervo.getAddressDetail()== null
				|| membervo.getAddressDetail().isEmpty()){
			membervo.setAddress("");
			membervo.setAddressDetail("");
		}
		
		String msg = "회원 수정 실패!", url = "/main/mypage/memberEdit";
		
		int cnt = memberService.updateMember(membervo);
		logger.info("회원정보 수정 결과, cnt={}", cnt);
		
		if(cnt > 0) {
			msg = "회원 수정 성공!";
			url= "/main/index";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	@RequestMapping("/memberOut")
	public String memberOut() {
		logger.info("회원 탈퇴 동의 화면");

		return "main/mypage/memberOut";
	}
	
	@GetMapping("/memberOutPwd")
	public String memberOutPwd(HttpSession session) {
		String userid=(String) session.getAttribute("userid");
		logger.info("회원 탈퇴 비밀번호 입력 화면, userid={}", userid);

		return "main/mypage/memberOutPwd";
	}
		
	@PostMapping("/memberOutPwd")
	public String memberOutPwd(@RequestParam String pwd, HttpSession session,
			HttpServletResponse response, Model model) {

		String userid=(String)session.getAttribute("userid");
		logger.info("회원 탈퇴 처리, pwd={}, userid={}" ,pwd, userid);

		int result=memberService.loginCheck(userid, pwd);
		logger.info("비밀번호 체크 결과, result={}", result);
		
		String msg="회원 탈퇴 실패",url="/mypage/memberOut";
		if(result==MemberService.LOGIN_OK) {
			int cnt=memberService.updateMemberOut(userid);
			logger.info("회원탈퇴 결과, cnt={}", cnt);
			
			if(cnt>0) {	
				msg="회원 탈퇴 성공";
				url="/main/index";

				session.invalidate();
				
				Cookie ck = new Cookie("ck_userid", userid);
				ck.setPath("/");
				ck.setMaxAge(0); 
				response.addCookie(ck);
			}
		}else if(result==MemberService.PWD_DISAGREE) {
			msg="비밀번호가 틀렸습니다";
			url="/main/mypage/memberOutPwd";
			
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}	
	
	@RequestMapping("/memberOutResult")
	public String memberOutResult() {
		logger.info("회원 탈퇴 결과 화면");

		return "main/mypage/memberOutResult";
	}
	
	@GetMapping("/newPwd")
	public String newPwd() {
		logger.info("비밀번호 변경 화면");
			
		return "main/mypage/newPwd";
	}
		
	@PostMapping("/newPwd")
	public String newPwd_post(HttpSession session, Model model, @RequestParam String pwd,
	                           @RequestParam String newPwd, @RequestParam String confirmPwd) {

	    String userid = (String) session.getAttribute("userid");

	    MemberVO existingMember = memberService.selectByUserid(userid);
	    if (existingMember != null) {
	        boolean isPasswordMatch = passwordEncoder.matches(pwd, existingMember.getPwd());

	        if (isPasswordMatch) {
	            String encodedNewPwd = passwordEncoder.encode(newPwd);

	            existingMember.setPwd(encodedNewPwd);
	            int cnt = memberService.updatePassword(existingMember);

	            if (cnt > 0) {
	                session.invalidate();

	                model.addAttribute("msg", "비밀번호 변경 성공!!.");
	                model.addAttribute("url", "/main/index");
	            } else {
	                model.addAttribute("msg", "비밀번호 변경 실패!!.");
	                model.addAttribute("url", "/main/mypage/newPwd");
	            }
	        } else {
	            model.addAttribute("msg", "현재 비밀번호가 일치하지 않습니다.");
	            model.addAttribute("url", "/main/mypage/newPwd");
	        }
	    } else {
	        model.addAttribute("msg", "사용자 정보를 찾을 수 없습니다.");
	        model.addAttribute("url", "/main/mypage/newPwd");
	    }

	    return "common/message";
	}

	
	@RequestMapping("/mypageOrderList")
	public String mypageOrderList(HttpSession session, Model model) {		
		logger.info("마이페이지 - 나의 주문 내역 조회 페이지");
		int no = (int)session.getAttribute("no");
		List<Map<String, Object>> orderList = orderService.selectOrderList(no);
		logger.info("주문내역조회 결과 orderList: {}", orderList);
		logger.info("주문내역개수 orderList.size(): {}", orderList.size());
		
		MainOrdersDetailVO modVo1 = new MainOrdersDetailVO();
		modVo1.setNo(no);
		modVo1.setOrdersState("취소 완료");
		int cnt1 = orderService.selectCntOrdersState(modVo1);
		
		MainOrdersDetailVO modVo2 = new MainOrdersDetailVO();
		modVo2.setNo(no);
		modVo2.setOrdersState("결제 완료");
		int cnt2 = orderService.selectCntOrdersState(modVo2);
		
		MainOrdersDetailVO modVo3 = new MainOrdersDetailVO();
		modVo3.setNo(no);
		modVo3.setOrdersState("배송중");
		int cnt3 = orderService.selectCntOrdersState(modVo3);
		
		MainOrdersDetailVO modVo4 = new MainOrdersDetailVO();
		modVo4.setNo(no);
		modVo4.setOrdersState("배송 완료");
		int cnt4 = orderService.selectCntOrdersState(modVo4);
		
		model.addAttribute("cnt1", cnt1);
		model.addAttribute("cnt2", cnt2);
		model.addAttribute("cnt3", cnt3);
		model.addAttribute("cnt4", cnt4);
		
		model.addAttribute("orderList", orderList);
		
		return "main/mypage/mypageOrderList";
	}
	
	@GetMapping("/myOrdersDetail")
	public String myOrdersDetail(@RequestParam(defaultValue = "0")int ordersNo,
			HttpSession session, Model model) {
		logger.info("마이페이지 - myOrdersDetail 페이지(주문 자세히 보기), 파라미터 ordersNo={}", ordersNo);
		
		if(ordersNo == 0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/main/index");

			return "common/message";
		}
		List<Map<String, Object>> mapList = odService.selectOrdersByNo(ordersNo);
		logger.info("주문관리 페이지 - 검색 결과 mapList.size()={}", mapList.size());
		
		model.addAttribute("title", "주문 상세보기 페이지");
		model.addAttribute("list", mapList);
		model.addAttribute("DELIVERY", ConstUtil.DELIVERY);
		model.addAttribute("TOTAL_PRICE", ConstUtil.TOTAL_PRICE);
		
		return "main/mypage/myOrdersDetail";
	}
	
	@RequestMapping("/mypageOrderCancle")
	public String mypageOrderCancle(@RequestParam(defaultValue = "0")int ordersNo,
			HttpSession session, Model model) {		
		logger.info("마이페이지 - 나의 주문 취소 하기, 파리미터 ordersNo={}", ordersNo);
		Map<String, String> map = new HashMap<>();
		map.put("ordersNo", ordersNo+"");
		
		logger.info("마이페이지 - deleteOrders 호출하기! map={}", map);
		
		orderService.deleteOrders(map);
		
		return "redirect:/main/mypage/mypageOrderList";
	}
	
	@RequestMapping("/mypageBasket")
	public String mypageBasket(HttpSession session, Model model) {
		
		logger.info("마이페이지 - 나의 장바구니 조회 페이지");
		
		return "main/mypage/mypageBasket";
	}
	
	@RequestMapping("/orderList")
	public String orderList(HttpSession session, Model model) {
		logger.info("주문 내역 조회 페이지");
		
		return "main/mypage/orderList";			
	}
   
	@RequestMapping("/myBoardList")
	public String myBoardList(HttpSession session, Model model) {
		logger.info("내 게시글 리스트 조회 페이지");
		
		List<Map<String , Object>> myBoardList = boardService.selectUserBoardList((int)session.getAttribute("no"));
		logger.info("내 게시글 리스트조회 결과 myBoardList.size(): {}", myBoardList.size());
		
		model.addAttribute("myBoardList", myBoardList);
		
		return "main/mypage/myBoardList";
	}
}