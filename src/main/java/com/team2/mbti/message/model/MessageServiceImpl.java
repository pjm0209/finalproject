package com.team2.mbti.message.model;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.team2.mbti.member.model.MemberVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MessageServiceImpl implements MessageService {
	private final MessageDao messageDao;
	
	@Override
	@Transactional
	public int insertSendDm(SendDmListVO sendDmListVo) {
		List<SendDmVO> list=sendDmListVo.getSendItems();
		int cnt=0;
		try {
			for(int i=0;i<list.size();i++) {
				SendDmVO vo=list.get(i);
				String sendBody=list.get(0).getSendBody();
				
				if(i>0) {
					vo.setSendBody(sendBody);
				}
				
				cnt=messageDao.insertSendDm(vo);
			}
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt; 
	}

	@Override
	public List<MemberVO> selectAllMemberbyDm() {
		return messageDao.selectAllMemberbyDm();
	}
	
}
