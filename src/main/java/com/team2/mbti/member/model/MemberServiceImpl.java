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
	
	//회원정보 수정
	@Override
	public int updateMember(MemberVO vo) {
		return memberDao.updateMember(vo);
	}
	
	//회원탈퇴
	@Override
	public int updateMemberOut(String userid) {
		return memberDao.updateMemberOut(userid);
	}

	//아이디 찾기 - 이름, 이메일
	@Override
	public MemberVO getMemberByNameAndEmail(String name, String email) {
		return memberDao.getMemberByNameAndEmail(name, email);
	}

	//아이디찾기 - 이름, 전화번호
	@Override
	public MemberVO getMemberByNameAndHp(String name, String hp) {
		return memberDao.getMemberByNameAndHp(name, hp);
	}

	//비밀번호 변경
	@Override
	public int updatePassword(MemberVO membervo) {
		return memberDao.updatePassword(membervo);
	}

}
