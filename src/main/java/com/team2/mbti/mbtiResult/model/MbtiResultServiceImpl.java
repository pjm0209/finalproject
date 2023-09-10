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
		MbtiResultVO resultVo=new MbtiResultVO();
		resultVo.setQuestionTypeNo(mbtiResultListVo.getMbtiResultItem().get(0).getQuestionTypeNo());
		
		if(no!=0) {
			resultVo.setNo(no);
		
			int count=mbtiResultDao.getMbtiResultCount(resultVo);
			
			if(count>0) {
				cnt=mbtiResultDao.deleteMbtiResultByQuestionTypeNo(resultVo);
			}
		}
		
		for(MbtiResultVO vo : mbtiResultListVo.getMbtiResultItem()) {
			if(no!=0) {
				vo.setNo(no);
			}
			cnt=mbtiResultDao.insertMbtiResult(vo);
		}
		
		return cnt;
	}

	@Override
	public List<MbtiResultVO> getResultVal(int no) {
		return mbtiResultDao.getResultVal(no);
	}

	@Override
	public int deleteNonMemberMbtiResult() {
		return mbtiResultDao.deleteNonMemberMbtiResult();
	}

	

}
