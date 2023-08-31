package com.team2.mbti.mbtisurvey.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.team2.mbti.common.SearchVO;
import com.team2.mbti.mbtiResult.model.MbtiResultListVO;
import com.team2.mbti.mbtiResult.model.MbtiResultVO;
import com.team2.mbti.member.model.MemberVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MbtiSurveyServiceImpl implements MbtiSurveyService{
	private final MbtiSurveyDAO mbtiSurveyDao;

	@Override
	public List<MbtiSurveyVO> selectAllMbtiSurvey(SearchVO vo) {
		return mbtiSurveyDao.selectAllMbtiSurvey(vo);
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
				if(vo.getMbtiSurveyNo()!=0) {
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

	@Override
	public int getTotalRecordMbti(SearchVO searchVo) {
		return mbtiSurveyDao.getTotalRecordMbti(searchVo);
	}

	@Override
	public List<MbtiSurveyVO> selectByQuestionTypeNoMbtiSurvey(int questionTypeNo) {
		return mbtiSurveyDao.selectByQuestionTypeNoMbtiSurvey(questionTypeNo);
	}

	@Override
	public MbtiVO selectMbti(String mbtiType) {
		return mbtiSurveyDao.selectMbti(mbtiType);
	}

	@Override
	public int getTotalRecordMbtiByQuestionTypeNo(MbtiResultVO mbtiResultVo) {
		return mbtiSurveyDao.getTotalRecordMbtiByQuestionTypeNo(mbtiResultVo);
	}

	@Override
	public List<MbtiVO> selectAllMbti() {
		return mbtiSurveyDao.selectAllMbti();
	}

	@Override
	public int updateMemberMbtiNoByNo(MemberVO memberVo) {
		return mbtiSurveyDao.updateMemberMbtiNoByNo(memberVo);
	}

	@Override
	public List<Map<String, Object>> selectMbtiStatisticsView(SearchVO searchVo) {
		return mbtiSurveyDao.selectMbtiStatisticsView(searchVo);
	}

	@Override
	public int getTotalRecordMbtiStatisticsView(SearchVO searchVo) {
		return mbtiSurveyDao.getTotalRecordMbtiStatisticsView(searchVo);
	}

	@Override
	public List<Map<String, Object>>selectMbtiStatistics(){
		return mbtiSurveyDao.selectMbtiStatistics();
	}

	@Override
	@Transactional
	public int deleteMbtiResult(MbtiResultListVO mbtiResultListVo) {
		int cnt=0;
		try {
			List<MbtiResultVO> list=mbtiResultListVo.getMbtiResultItem();
			for(MbtiResultVO mbtiResultVo : list) {
				if(mbtiResultVo.getNo()!=0) {
					cnt=mbtiSurveyDao.deleteMbtiResult(mbtiResultVo);
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