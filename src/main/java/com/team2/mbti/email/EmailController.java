package com.team2.mbti.email;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.mbti.member.model.MemberService;
import com.team2.mbti.member.model.MemberVO;

import jakarta.mail.MessagingException;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main/member")
public class EmailController {
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	private final PasswordEncoder passwordEncoder;
	private final EmailSender emailSender;
	private final MemberService memberService;
	
	@ResponseBody
	@RequestMapping("/ajaxsendEmail")
	public String email(@ModelAttribute MemberVO membervo) {
		
		logger.info("ajax 이용 메일 보내기, membervo={}", membervo);
		Map<String, Object>map = new HashMap<>();
		map.put("userid", membervo.getUserid());
		map.put("email", membervo.getEmail());
		
		int result=memberService.emailCheck(map); //이메일 확인
		logger.info("이메일 확인 완료, result={}", result);
		
		String str = getTempPassword(); //임시 랜덤 비밀번호

		
		String receiver = "pjm0209z@naver.com"; //받는 사람의 이메일 주소
		String subject="임시 비밀번호 안내문";
		String content="임시 비밀번호 안내에 대한 이메일입니다. + 임시 비밀번호는 ["+ str +"]입니다.";
		String sender = "yongjin818@naver.com"; //보내는 사람의 이메일 주소

		//int result=0;
		int cnt=0;

		try {
			emailSender.sendEmail(subject, content, receiver, sender);
			logger.info("메일 발송 성공!");
			
			if(result == MemberService.EMAIL_OK) {
				membervo.setPwd(passwordEncoder.encode(str));
				cnt =memberService.updatePassword(membervo);
				logger.info("비밀번호 암호화 처리, cnt={}", cnt);
			}
		} catch (MessagingException e) {
			logger.info("메일 발송 실패 : " + e.getMessage());
			e.printStackTrace();
		}
		
		return "";
	}
			
    public String getTempPassword(){
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
        
        String str = "";

        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            str += charSet[idx];
        }
        return str;
    }

}
