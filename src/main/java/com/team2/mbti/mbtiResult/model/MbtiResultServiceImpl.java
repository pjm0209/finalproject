package com.team2.mbti.mbtiResult.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MbtiResultServiceImpl implements MbtiResultService {
	private final MbtiResultDAO mbtiResultDao;
	
	@Override
	public int insertMbtiResultList(MbtiResultListVO mbtiResultListVo,int no) {
		int cnt=0;
		System.out.println("비회원 no="+no);
		MbtiResultVO resultVo=new MbtiResultVO();
		resultVo.setQuestionTypeNo(mbtiResultListVo.getMbtiResultItem().get(0).getQuestionTypeNo());
		
		if(no!=0) {
			resultVo.setNo(no);
		
			int count=mbtiResultDao.getMbtiResultCount(resultVo);
			
			if(count>0) {
				cnt=mbtiResultDao.deleteMbtiResultByQuestionTypeNo(resultVo);
			}
		}
		
		System.out.println("비회원 no="+no);
		for(MbtiResultVO vo : mbtiResultListVo.getMbtiResultItem()) {
			if(no!=0) {
				vo.setNo(no);
			}
			System.out.println("비회원 vo="+vo);
			cnt=mbtiResultDao.insertMbtiResult(vo);
		}
		
		System.out.println("비회원 no="+no);
		return cnt;
	}

	@Override
	public List<MbtiResultVO> getResultVal(int no) {
		return mbtiResultDao.getResultVal(no);
	}



}
