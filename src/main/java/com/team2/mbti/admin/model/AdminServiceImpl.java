package com.team2.mbti.admin.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.team2.mbti.common.SearchVO;
import com.team2.mbti.member.model.MemberService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {
	
	private final AdminDAO adminDao;

	@Override
	public int dupUserid(String adminId) {
		int count=adminDao.checkAdminId(adminId);
		int result=0;
		if(count>0) {
			result=MemberService.EXIST_ID;
		}else {
			result=MemberService.NONE_EXIST_ID;			
		}

		return result;
	}	
	
	@Override
	public int loginCheck(String adminId, String adminPwd) {
		int result=0;
		String dbPwd=adminDao.selectAdminPwd(adminId);
		
		if(dbPwd!=null && !dbPwd.isEmpty()) {
			if(dbPwd.equals(adminPwd)) {
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
	public List<AdminVO> selectAllManager(SearchVO vo) {
		return adminDao.selectAllManager(vo);
	}

	@Override
	public int getTotalRecordManager(SearchVO searchVo) {
		return adminDao.getTotalRecordManager(searchVo);
	}

	@Override
	public int selectAdminNo(String adminId) {
		return adminDao.selectAdminNo(adminId);
	}

	@Override
	public int insertManager(AdminVO adminvo) {	
		return adminDao.insertManager(adminvo);
	}

	@Override
	public String adminIdSearch(Map<String, Object> map) {
		return adminDao.adminIdSearch(map);
	}

	@Override
	public int checkAdminId(String adminId) {
		return adminDao.checkAdminId(adminId);
	}

	@Override
	@Transactional
	public int deleteMultiAdmin(List<AdminVO> list) {
		int cnt=0;
		
		try {
			for(AdminVO vo : list) {
				int adminNo = vo.getAdminNo();
				if(adminNo!=0) { 
					cnt=adminDao.deleteMultiAdmin(adminNo);
				}
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}
}