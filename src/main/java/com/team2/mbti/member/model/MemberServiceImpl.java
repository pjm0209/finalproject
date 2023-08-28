package com.team2.mbti.member.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.team2.mbti.common.SearchVO;

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

	@Override
	public MemberVO findId(String name, String tel) {
		return memberDao.findId(name, tel);
	}

}
