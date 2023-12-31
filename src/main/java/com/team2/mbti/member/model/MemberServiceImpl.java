package com.team2.mbti.member.model;

import java.util.List;
import java.util.Map;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.team2.mbti.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
	private final MemberDAO memberDao;
	
	
	private final PasswordEncoder passwordEncoder;
	

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
			if(passwordEncoder.matches(pwd, dbPwd)) {
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
	
	@Override
	public int updateMember(MemberVO vo) {
		return memberDao.updateMember(vo);
	}
	
	@Override
	public int updateMemberOut(String userid) {
		return memberDao.updateMemberOut(userid);
	}

	@Override
	public MemberVO getMemberByNameAndEmail(String name, String email) {
		return memberDao.getMemberByNameAndEmail(name, email);
	}

	@Override
	public MemberVO getMemberByNameAndHp(String name, String hp) {
		return memberDao.getMemberByNameAndHp(name, hp);
	}
	
	@Override
	public int emailCheck(Map<String, Object>map) {
		int email = memberDao.emailCheck(map);
		System.out.println("이메일 처리 확인 email" + email);
		int result=0;
		if(email==0) {
			result=EMAIL_DISAGREE;
		}else {
			result=EMAIL_OK;
		}
					
		return result;
	}
		
	
	@Override
	public String pwdCheck(String userid) {
		return memberDao.pwdCheck(userid);
	}

	@Override
	public int updatePassword(MemberVO membervo) {
		return memberDao.updatePassword(membervo);
	}

	@Override
	public int getTotalMember(MemberVO membervo) {
		return memberDao.getTotalMember(membervo);
	}

	@Override
	public int getTodayMember(MemberVO membervo) {
		return memberDao.getTodayMember(membervo);
	}

	@Override
	public int getWeekMember(MemberVO membervo) {
		return memberDao.getWeekMember(membervo);
	}

}
