package com.team2.mbti.member.model;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.team2.mbti.common.SearchVO;

import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
	private final MemberDAO memberDao;

	@Override
	public int insertMember(MemberVO membervo) {
		return memberDao.insertMember(membervo);				
	}

	@Override
	public List<MemberVO> selectAllMember(SearchVO vo) {
		return memberDao.selectAllMember(vo);
	}

	@Override
	public int getTotalRecordMember(SearchVO searchVo) {
		return memberDao.getTotalRecordMember(searchVo);
	}
	
	@Override
	public String memberIdSearch(Map<String, Object> map) {
		return memberDao.memberIdSearch(map);
	}

	@Override
	public int selectCheckId(String userid) {
		int count = memberDao.selectCheckId(userid);

		int result=0;
		if(count>0) {
			result = MemberService.EXIST_ID;			
		}else {
			result = MemberService.NONE_EXIST_ID;			
		}
		return result;
	}
	
	@Override
	public String selectPwd(String userid) {
		return memberDao.selectPwd(userid);
	}

	@Override
	public int loginCheck(String userid, String pwd) {
		int result=0;
		String dbPwd= memberDao.selectPwd(userid);
		
		if(dbPwd!=null && !dbPwd.isEmpty()) {
			if(dbPwd.equals(pwd)) {
				result=MemberService.LOGIN_OK;
			}else {
				result=MemberService.PWD_DISAGREE;
			}
		}else {
			result=MemberService.USERID_NONE;
		}

		return result;
	}
	
	@Override
	public MemberVO selectByUserid(String userid) {
		return memberDao.selectByUserid(userid);
	}
	
	@Override
	@Transactional
	public int deleteMultiMember(List<MemberVO> list) {
		int cnt=0;
		
		try {
			for(MemberVO vo : list) {
				int no = vo.getNo();
				if(no!=0) { 
					cnt=memberDao.deleteMultiMember(no);
				}
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}
	
	//회원정보 수정
	@Override
	public int updateMember(MemberVO vo) {
		return memberDao.updateMember(vo);
	}

	//비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(MemberVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "yongjin818@naver.com";
		String hostSMTPpwd = "gin04191800@@";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "yongjin818@naver.com";
		String fromName = "방용진";
		String subject = "임시 비밀번호 발송";
		String msg = "임시 비밀번호를 전송하였습니다.";

		if(div.equals("findpwd")) {
			subject = "베프마켓 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getUserid() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getPwd() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	//비밀번호찾기
	@Override
	public void findPwd(HttpServletResponse response, MemberVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		MemberVO ck = memberDao.readMember(vo.getUserid());
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(memberDao.selectByUserid(vo.getUserid()) == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!vo.getEmail().equals(ck.getEmail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pwd = "";
			for (int i = 0; i < 12; i++) {
				pwd += (char) ((Math.random() * 26) + 97);
			}
			vo.setPwd(pwd);
			// 비밀번호 변경
			memberDao.updatePw(vo);
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "findpwd");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

}
