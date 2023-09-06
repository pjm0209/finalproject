package com.team2.mbti.message.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.team2.mbti.member.model.MemberVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MessageServiceImpl implements MessageService {
	private final MessageDao messageDao;
	
	@Override
	public List<MemberVO> selectAllMemberbyDm() {
		return messageDao.selectAllMemberbyDm();
	}

	//관리자가 쪽지 보내기
	@Override
	public int insertSendDmToAdmin(SendDmListVO sendDmListVo, int adminNo) {
		List<SendDmVO> list=sendDmListVo.getSendItems();
		int cnt=0;
		int idx=0;
		try {
			for(int i=0;i<list.size();i++) {
				SendDmVO vo=list.get(i);
				vo.setAdminNo(adminNo);
				String sendBody=list.get(0).getSendBody();
				
				if(i>0) {
					vo.setSendBody(sendBody);
				}
				
				if(vo.getReceiveNo()!=0) {
					cnt=messageDao.insertSendDmToAdmin(vo);
					ReceiveDmVO receiveDmVo= new ReceiveDmVO();
					
					receiveDmVo.setSendDmNo(vo.getSendDmNo());
					cnt=messageDao.insertReceiveDm(receiveDmVo);
					
					idx++;
				}
			}
			
			if(idx==0) {
				List<MemberVO> memList=messageDao.selectAllMemberbyDm();
				for(int i=0;i<memList.size();i++) {
					MemberVO memberVo=memList.get(i);
					SendDmVO vo=new SendDmVO();
					
					vo.setAdminNo(adminNo);
					vo.setReceiveNo(memberVo.getNo());
					vo.setSendBody(sendDmListVo.getSendItems().get(0).getSendBody());
					
					cnt=messageDao.insertSendDmToAdmin(vo);
					
					ReceiveDmVO receiveDmVo= new ReceiveDmVO();
					
					receiveDmVo.setSendDmNo(vo.getSendDmNo());
					cnt=messageDao.insertReceiveDm(receiveDmVo);
				}
			}
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt; 
	}

	
	//회원이 쪽지 보내기
	@Override
	public int insertSendDmToMember(SendDmListVO sendDmListVo, int no) {
		List<SendDmVO> list=sendDmListVo.getSendItems();
		int cnt=0;
		try {
			for(int i=0;i<list.size();i++) {
				SendDmVO vo=list.get(i);
				vo.setNo(no);
				String sendBody=list.get(0).getSendBody();
				
				if(i>0) {
					vo.setSendBody(sendBody);
				}
				
				cnt=messageDao.insertSendDmToMember(vo);
				ReceiveDmVO receiveDmVo= new ReceiveDmVO();
				receiveDmVo.setSendDmNo(vo.getSendDmNo());
				
				cnt=messageDao.insertReceiveDm(receiveDmVo);
			}
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}

	@Override
	public List<Map<String, Object>> messageViewById(String id) {
		return messageDao.messageViewById(id);
	}

	@Override
	public Map<String, Object> selectMessageViewBySendDmNo(int sendDmNo) {
		int cnt=messageDao.updateReceiveDmReadDate(sendDmNo);
		
		return messageDao.selectMessageViewBySendDmNo(sendDmNo);
	}

	@Override
	public int deleteSendDmBySendDmNo(SendDmListVO sendDmListVo) {
		int cnt=0;
		
		List<SendDmVO> list=sendDmListVo.getSendItems();
		for(SendDmVO vo : list) {
			int sendDmNo=vo.getSendDmNo();
			if(sendDmNo!=0) {
				cnt=messageDao.deleteSendDmBySendDmNo(sendDmNo);
			}
		}
		
		return cnt;
	}

	@Override
	public int insertSendDmToMemberMyMessage(SendDmVO sendDmVo) {
		int cnt=0;
		try {
			cnt=messageDao.insertSendDmToMemberMyMessage(sendDmVo);
			
			ReceiveDmVO receiveDmVo = new ReceiveDmVO();
			receiveDmVo.setSendDmNo(sendDmVo.getSendDmNo());
			
			cnt=messageDao.insertReceiveDm(receiveDmVo);
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}

	@Override
	public List<MemberVO> selectAllMemberbyDmSearch(MemberVO memberVo) {
		return messageDao.selectAllMemberbyDmSearch(memberVo);
	}
	
}
