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
	public List<CommentsVO> selectCommentList(int boardNo) {
		return commentDao.selectCommentList(boardNo);
	}

	@Override
	public void deleteComment(Map<String, String> map) {
		commentDao.deleteComment(map);
	}

	@Override
	public int insertCommentReply(CommentVO vo) {
		return commentDao.insertCommentReply(vo);
	}

	@Override
	public int updateComment(CommentVO vo) {
		return commentDao.updateComment(vo);
	}
}