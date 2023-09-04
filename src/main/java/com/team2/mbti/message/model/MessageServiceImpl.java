package com.team2.mbti.message.model;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.team2.mbti.member.model.MemberDAO;
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
		try {
			if(sendDmListVo.getSendItems().get(0).getReceiveNo()!=0) {
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
					}
				}
			}else {
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
	
}
