package com.team2.mbti.member.model;

import java.util.List;

import org.springframework.stereotype.Service;

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


}
