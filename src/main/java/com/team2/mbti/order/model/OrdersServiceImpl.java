package com.team2.mbti.order.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrdersServiceImpl implements OrdersService {
	private final OrdersDAO ordersDao;
	private static final Logger logger = LoggerFactory.getLogger(OrdersServiceImpl.class);

	@Override
	public List<SortOrderViewVO> selectAllAjaxOrderList(SortOrderViewVO vo) {
		logger.info("ajax로 주문리스트 불러오기 시작");
		return ordersDao.selectAllAjaxOrderList(vo);
	}

	@Override
	public int selectOrdersCnt(SortOrderViewVO vo) {
		return ordersDao.selectOrdersCnt(vo);
	}

	@Override
	public int updateAjaxState(OrdersDetailVO vo) {
		return ordersDao.updateAjaxState(vo);
	}

	@Override
	public List<Map<String, Object>> selectOrdersByNo(int ordersNo) {
		return ordersDao.selectOrdersByNo(ordersNo);
	}

	@Override
	public int updateAjaxRecipient(OrderVO vo) {
		return ordersDao.updateAjaxRecipient(vo);
	}

	@Override
	@Transactional
	public int updateStateMulti(List<SortOrderViewVO> list, String ordersState) {
		
		int cnt = 0;
		
		try {
			for(SortOrderViewVO vo : list) {
				
				int ordersNo = vo.getOrdersNo();
				if(ordersNo!=0) { //체크한 상품들만 등록
					OrdersDetailVO od = new OrdersDetailVO();
					od.setOrdersNo(ordersNo);
					od.setOrdersState(ordersState);
					
						//등록되어 있지 않은 경우
				cnt = ordersDao.updateAjaxState(od);
				}
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}
	
}
//
