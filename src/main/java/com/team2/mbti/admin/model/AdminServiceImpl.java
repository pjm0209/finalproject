package com.team2.mbti.admin.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {
	private final AdminDAO adminDao;

	@Override
	public int adminLoginCheck(String userid, String pwd) {
		return 0;
	}
}