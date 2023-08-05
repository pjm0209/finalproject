package com.team2.mbti.mbtisurvey.model;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MbtiSurveyServiceImpl implements MbtiSurveyService{
	private final MbtiSurveyDAO mbtiSurveyDao;

	@Override
	public List<MbtiSurveyVO> selectAllMbtiSurvey() {
		return mbtiSurveyDao.selectAllMbtiSurvey();
	}

	@Override
	public int insertMbtiSurvey(MbtiSurveyVO vo) {
		return mbtiSurveyDao.insertMbtiSurvey(vo);
	}

	@Override
	public MbtiSurveyVO selectByNoMbtiSurvey(int mbtiServeyNo) {
		return mbtiSurveyDao.selectByNoMbtiSurvey(mbtiServeyNo);
	}

	@Override
	public int updateMbtiSurvey(MbtiSurveyVO vo) {
		return mbtiSurveyDao.updateMbtiSurvey(vo);
	}

	@Override
	@Transactional
	public int deleteMultiMbtiSurvey(List<MbtiSurveyVO> list) {
		int cnt=0;
		try {
			for(MbtiSurveyVO vo : list) {
				if(vo.getMbtiServeyNo()!=0) {
					cnt=mbtiSurveyDao.deleteMbtiSurvey(vo);
				}
			}
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}
	
}
