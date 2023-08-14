package com.team2.mbti.member.model;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.team2.mbti.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
	private final MemberDAO memberDao;

	@Override
	public int insertMember(MemberVO vo) {
		return memberDao.insertMember(vo);				
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
	public MemberVO selectByNoMember(int no) {
		return memberDao.selectByNoMember(no);
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
	public int deleteMember(int no) {
		return memberDao.deleteMember(no);
	}

	@Override
	public int loginCheck(String userid, String pwd) {
		int result=0;
		String dbPwd= memberDao.selectMemberPwd(userid);
		
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
	public int selectMemberNo(String userid) {		 
		return memberDao.selectMemberNo(userid);
	}
}
