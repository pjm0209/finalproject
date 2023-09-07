package com.team2.mbti.main.basket.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.team2.mbti.main.basket.controller.MainBasketController;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainBasketServiceImpl implements MainBasketService {
	private final MainBasketDAO mainBasketDao;
	private static final Logger logger = LoggerFactory.getLogger(MainBasketController.class);

	@Override
	public int insertBasket(MainBasketVO vo) {
		int count = mainBasketDao.selectCountBasket(vo);
		logger.info("장바구니에 동일항목있는지 검사 후 그 결과는 count={}", count);
		
		int cnt = 0;
		if (count > 0) { // 해당 사용자가 이미 장바구니에 담은 상품이 존재하면 수량만 update
			cnt = mainBasketDao.updateBasketQty(vo);
			logger.info("장바구니 수량 update 결과 ,cnt={}", cnt);
		} else {
			cnt = mainBasketDao.insertBasket(vo);
			logger.info("장바구니 insert 결과 ,cnt={}", cnt);
		}

		return cnt;
	}

	@Override
	public List<Map<String, Object>> selectBasketBookView(int no) {
		return mainBasketDao.selectBasketBookView(no);
	}

	@Override
	public int selectCountBasket(MainBasketVO vo) {
		return mainBasketDao.selectCountBasket(vo);
	}

	
	@Override
	public int updateBasketQty(MainBasketVO vo) {
		return mainBasketDao.updateBasketQty(vo);
	}
	@Override
	public int deleteByBasketNo(int basketNo) {
		return mainBasketDao.deleteByBasketNo(basketNo);
	}
	
	
	@Override
	public int editBasketQty(MainBasketVO vo) {
		return mainBasketDao.editBasketQty(vo);
	}

	@Override
	public int deleteBasket(int bookNo) {
		return mainBasketDao.deleteBasket(bookNo);
	}

	@Override
	public int deleteCartByNo(int no) {
		return mainBasketDao.deleteCartByNo(no);
	}

	@Override
	public MainBasketVO selectCartByCartNo(int basketNo) {
		return mainBasketDao.selectCartByCartNo(basketNo);
	}

	

};
