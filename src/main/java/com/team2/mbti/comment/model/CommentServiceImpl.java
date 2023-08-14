package com.team2.mbti.comment.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommentServiceImpl implements CommentService {
	private final CommentDAO commentDao;

	@Override
	public int insertComments(CommentVO vo) {
		return commentDao.insertComments(vo);
	}

	@Override
	public List<Map<String, Object>> selectCommentList() {
		return commentDao.selectCommentList();
	}
}