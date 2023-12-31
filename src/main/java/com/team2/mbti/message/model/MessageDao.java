package com.team2.mbti.message.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team2.mbti.common.SearchVO;
import com.team2.mbti.member.model.MemberVO;

@Mapper
public interface MessageDao {
	//관리자 - 쪽지 보내기
	int insertSendDmToAdmin(SendDmVO sendDmVo);
	int insertReceiveDm(ReceiveDmVO receiveDmVo);
	int insertSendDmToMember(SendDmVO sendDmVo);
	//관리자 - 쪽지 관리 목록
	List<MemberVO> selectAllMemberbyDm();
	//마이페이지 - 내 쪽지함 목록
	List<Map<String, Object>> messageViewById(String id);
	//마이페이지 - 내 쪽지함 상세보기
	Map<String, Object> selectMessageViewBySendDmNo(int sendDmNo);
	//쪽지 삭제
	int deleteSendDmBySendDmNo(int sendDmNo);
	//마이페이지 - 내 쪽지함 쪽지 보내기
	int insertSendDmToMemberMyMessage(SendDmVO sendDmVo);
	//관리자 - 쪽지 관리 - 검색
	List<MemberVO> selectAllMemberbyDmSearch(MemberVO memberVo);
	//관리자 - 쪽지 목록
	List<Map<String, Object>> selectMessageViewByAdmin();
	List<Map<String, Object>> selectMessageViewByAdminSearch(SearchVO searchVo);
	
	//관리자 - 쪽지 읽은날짜 업데이트
	int updateReceiveDmReadDate(int sendDmNo);
	
	//관리자 - 쪽지 온 갯수(읽지 않은 쪽지의 수)
	int getAdminMessageCount();
}
