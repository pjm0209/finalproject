package com.team2.mbti.mbtiResult.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MbtiResultServiceImpl implements MbtiResultService {
	private final MbtiResultDAO mbtiResultDao;
	
	@Override
	public int insertMbtiResultList(MbtiResultListVO mbtiResultListVo,int no) {
		int cnt=0;
		for(MbtiResultVO vo : mbtiResultListVo.getMbtiResultItem()) {
			vo.setNo(no);
			cnt=mbtiResultDao.insertMbtiResult(vo);
		}
		
		return cnt;
	}

}
