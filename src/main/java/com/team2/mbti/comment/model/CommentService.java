package com.team2.mbti.comment.model;

import java.util.List;
import java.util.Map;

public interface CommentService {
	int insertComments(CommentVO vo);
	List<CommentsVO> selectCommentList(int boardNo);
	
	void deleteComment(Map<String, String> map);
	
	int insertCommentReply(CommentVO vo);
	int updateComment(CommentVO vo);
}