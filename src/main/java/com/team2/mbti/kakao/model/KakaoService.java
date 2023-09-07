package com.team2.mbti.kakao.model;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.team2.mbti.member.model.MemberDAO;
import com.team2.mbti.member.model.MemberVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class KakaoService {
	private static final Logger logger = LoggerFactory.getLogger(KakaoService.class);
	
	private final MemberDAO memberDao;
	private final PasswordEncoder passwordEncoder;
	
    public String getKakaoAccessToken (String code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=63aae7bb7049cc37773c9691d2c30682"); // TODO REST_API_KEY 입력
            sb.append("&redirect_uri=http://localhost:9091/mbti/oauth/kakao"); // TODO 인가코드 받은 redirect_uri 입력
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            //결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body1 : " + result);

            //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return access_Token;
    }
    
    public HashMap<String, Object> getUserInfo (String access_Token) {
        
        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            
            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);
            
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body2 : " + result);
            
            //카카오톡 회원가입
            MemberVO vo = new MemberVO();
            String id=result.substring(6, result.indexOf(','));
            int idx=result.indexOf("nickname");
            System.out.println("idx="+idx);
            int idx2=result.indexOf("kakao_account");
            System.out.println("idx2="+idx2);
            
            String pwd=passwordEncoder.encode("123");
            String name=result.substring(idx+11, idx2-4);
            vo.setUserid(id);
            vo.setName(name);
            vo.setKakaoIdFlag("Y");
            logger.info("id={}, name={}",id,name);
			
			int count=memberDao.getKakaoIdCount(vo);
			logger.info("카카오톡 아이디 회원가입 여부 결과 count={}",count);
			
			vo.setPwd(pwd);
			if(count==0) { //회원가입한 아이디가 없을때 int
				int cnt=memberDao.insertKakaoMember(vo);
				logger.info("카카오톡 회원가입 결과 cnt={}",cnt);
			}else {
				logger.info("카카오톡 로그인 성공 id={},name={}",id,name);
			}
			
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
            
            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            //String email = kakao_account.getAsJsonObject().get("email").getAsString();
            
            userInfo.put("nickname", nickname);
            userInfo.put("userid", id);
            userInfo.put("name", name);
            //userInfo.put("email", email);
            
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return userInfo;
    }

}
 